#!/usr/bin/env python2

"""
find duplicate files based on size, and md5sum, inode
calculate potential diskspace saving based on converting same files to hard
links.  Sort similar files and prompt user to unify similar files into a single
inode.

TODO: add option to sort by similar filenames/regadless of filesize and md5sum,
in order to potentially clear old versions of the same file.

Author: Amro Diab
Date: 10/05/2016

"""

import __builtin__
import json
import os
import sys
import time

from optparse import OptionParser
from pprint import pprint

from debug import print_debug
from filestructure import FileStructure, Md5Structure, WorkQueue
from processthreads import FileThread, Md5Thread
from progress import ProgressBar

CURRENT_DIR = os.getcwd()
__builtin__.exitFlag = 0



def print_status(title):
    """Print current stage title"""

    sys.stderr.write("\n* {}\n".format(title))


def parse_options():
    """ parse commandline options """

    parser = OptionParser()

    parser.add_option("-d", "--debug", action="store_true", default=False,
                      help="turn on debug output")
    parser.add_option("-p", "--pretty_print", action="store_true",
                      default=False, help="pretty print json")
    parser.add_option("-t", "--threads", type="int", default=30,
                      help="number of threads in pool")
    parser.add_option("-f", "--ignore_dot_files", action="store_true",
                      default=False, help="do not process dot files")
    parser.add_option("-r", "--ignore_dot_dirs", action="store_true",
                      default=False, help="do not process dot dirs")
    parser.add_option("-i", "--ignore_dirs", type="str", default="",
                      help="list of comma separated directory names to ignnore")
    parser.add_option("-x", "--ignore_files", type="str", default="",
                      help="list of comma sepatated filenames to ignore")
    parser.add_option("-s", "--minimum_file_size", type="int", default=None,
                      help="minimum file size to check (bytes)")
    parser.add_option("-o", "--only_file_extension", type="str", default="",
                      help="single file extension to compare")
    (options, _) = parser.parse_args()
    return options


def human_bytes(num, suffix='B'):
    """ convert from bytes to human-readable format with unit suffix """

    for unit in ['', 'Ki', 'Mi', 'Gi', 'Ti', 'Pi', 'Ei', 'Zi']:
        if abs(num) < 1024.0:
            return "%3.1f%s%s" % (num, unit, suffix)
        num /= 1024.0
    return "%.1f%s%s" % (num, 'Yi', suffix)

def main():
    """ main function if not called as a module """

    def print_progress(progress):
        """ print and update progress bar """
        remaining = float(initial_qsize - work_queue.qsize())
        progress.current = remaining
        progress()

    options = parse_options()

    __builtin__.debug = options.debug
    pretty = options.pretty_print
    max_count = options.threads
    minimum_file_size = options.minimum_file_size
    only_file_extension = options.only_file_extension

    ignore_dot_files = options.ignore_dot_files
    ignore_dot_dirs = options.ignore_dot_dirs

    ignore_files = [x.strip() for x in options.ignore_files.split(',')]
    ignore_dirs = [x.strip() for x in options.ignore_dirs.split(',')]

    thread_list = list("Thread {}".format(x) for x in range(max_count))

    work_queue = WorkQueue()
    queue_lock = work_queue.queueLock

    threads = []
    thread_id = 1

    print_status("Generating Threads")
    thread_progress = ProgressBar(len(thread_list), fmt=ProgressBar.FULL)

    # Create new threads
    for iteration, thread_name in enumerate(thread_list):
        thread = FileThread(thread_id, thread_name, work_queue)
        thread.start()
        threads.append(thread)
        thread_id += 1
        thread_progress.current = iteration
        thread_progress()
    thread_progress.done()

    # Acquire file list
    print_status("Getting file list")
    queue_lock.acquire()
    for (dirname, dirs, files) in os.walk(CURRENT_DIR):

        # strip out ignored dirs
        dirs[:] = [d for d in dirs if not d[0] == '.'] if ignore_dot_dirs else dirs
        dirs[:] = [x for x in dirs if x not in ignore_dirs]

        # strip out ignored files
        files = [f for f in files if not f[0] == '.'] if ignore_dot_files else files
        files = [x for x in files if x not in ignore_files]
        files = [x for x in files if x.endswith(only_file_extension)]

        for filename in files:
            fullpath = dirname + '/' + filename
            print_debug(fullpath)
            work_queue.put(fullpath)

    queue_lock.release()

    print_status("Getting file metadata")
    initial_qsize = float(work_queue.qsize())
    progress = ProgressBar(work_queue.qsize(), fmt=ProgressBar.FULL)

    # Wait for queue to empty
    while not work_queue.empty():
        print_progress(progress)
        time.sleep(0.1)

    print_progress(progress)
    progress.done()

    # Notify threads it's time to exit
    __builtin__.exitFlag = 1
    print_debug("I am here")

    # Wait for all threads to complete
    for thread in threads:
        thread.join()

    print_status("Removing non-duplicate files from list")
    my_dict = dict(FileStructure().get())
    num_files = sum(len(v) for v in my_dict.itervalues())
    dupe_progress = ProgressBar(num_files, fmt=ProgressBar.FULL)

    keys_to_delete = []
    keys_to_delete.append('0')
    i = 0

    for key, value in my_dict.iteritems():
        i += len(value.keys())
        if len(value.keys()) != 1 and key != '0' and key > minimum_file_size:
            work_queue.put({key: value})
            dupe_progress.current = i
            dupe_progress()
    dupe_progress.done()

    print_status("Collecting md5 checksums")

    initial = float(work_queue.qsize())

    md5_progress = ProgressBar(initial, fmt=ProgressBar.FULL)

    __builtin__.exitFlag = 0
    for iteration, thread_name in enumerate(thread_list):
        thread = Md5Thread(thread_id, thread_name, work_queue)
        thread.start()
        threads.append(thread)

        thread_id += 1
        md5_progress.current = iteration
        md5_progress()
    __builtin__.exitFlag = 1

    while not work_queue.empty():
        remaining = initial - work_queue.qsize()
        md5_progress.current = remaining
        md5_progress()
        work_queue.get()

    md5_progress()
    md5_progress.done()

    for thread in threads:
        thread.join()

    print_status("calculating disk usage savings")
    my_new_hash = dict(Md5Structure().get())

    total_system = 0
    for md5 in my_new_hash.keys():
        if len(my_new_hash[md5]['entries']) > 1:

            filenames = []  # to collect file names from the various inodes
            count = len(my_new_hash[md5]['entries'])
            size = int(my_new_hash[md5]['size'])
            total_size = (int(size) * count) - int(size)
            for key, value in my_new_hash[md5]['entries'].items():
                filenames.append((key, value))
            sys.stdout.write("md5:{}\n".format(md5))
            sys.stdout.write("inode:{}\n".format(value))
            sys.stdout.write("entries:")
            pprint(filenames)
            print
            print "single size: ", size
            print "number of files: ", count
            print "saving for cluster ", total_size
            print "\n"
            total_system += total_size
            print "-"*20
        else:
            del my_new_hash[md5]

    if pretty:
        print json.dumps(my_new_hash, indent=4, sort_keys=True)
    else:
        #print json.dumps(my_dict)
        print

    print "\n\n\nTotal potential saving entire subtree: {}".format(human_bytes(total_system))

if __name__ == '__main__':
    main()
