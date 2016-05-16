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

import json
import os
import sys
import time
import __builtin__

from optparse import OptionParser
from filestructure import FileStructure, WorkQueue
from debug import print_debug
from processthreads import FileThread
from progress import ProgressBar

CURRENT_DIR = os.getcwd()
__builtin__.exitFlag = 0



def print_status(title):
    """Print current stage title"""

    sys.stderr.write("* {}\n".format(title))


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

    options = parse_options()

    __builtin__.debug = options.debug
    pretty = options.pretty_print
    max_count = options.threads
    minimum_file_size = options.minimum_file_size

    ignore_dot_files = options.ignore_dot_files
    ignore_dot_dirs = options.ignore_dot_dirs

    ignore_files = [x.strip() for x in options.ignore_files.split(',')]
    ignore_dirs = [x.strip() for x in options.ignore_dirs.split(',')]

    print ignore_files
    print ignore_dirs
    print

    thread_list = list("Thread {}".format(x) for x in range(max_count))

    work_queue = WorkQueue()
    queue_lock = work_queue.queueLock

    threads = []
    thread_id = 1

    print_status("Generating Threads")

    # Create new threads
    for thread_name in thread_list:
        thread = FileThread(thread_id, thread_name, work_queue)
        thread.start()
        threads.append(thread)
        thread_id += 1

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

        for filename in files:
            fullpath = dirname + '/' + filename
            print_debug(fullpath)
            work_queue.put(fullpath)

    queue_lock.release()

    initial_qsize = float(work_queue.qsize())


    def print_progress(progress):
        """ print and update progress bar """
        remaining = float(initial_qsize - work_queue.qsize())
        progress.current = remaining
        progress()

    progress = ProgressBar(work_queue.qsize(), fmt=ProgressBar.FULL)
    print_status("Getting file metadata")

    # Wait for queue to empty
    while not work_queue.empty():
        print_progress(progress)
        time.sleep(0.1)

    print_progress(progress)
    progress.done()
    print

    # Notify threads it's time to exit
    __builtin__.exitFlag = 1
    print_debug("I am here")

    # Wait for all threads to complete
    for thread in threads:
        thread.join()

    print_debug("Exiting Main Thread")

    my_dict = dict(FileStructure().get())

    print_status("Removing non repeated files from consideration")

    keys_to_delete = []
    keys_to_delete.append('0')
    for key, value in my_dict.iteritems():
        if len(value.keys()) == 1:
            keys_to_delete.append(key)
    for key in keys_to_delete:
        try:
            del my_dict[key]
        except KeyError:
            pass


    if pretty:
        print json.dumps(my_dict, indent=4, sort_keys=True)
    else:
        print
        #print json.dumps(my_dict)
        """
    for md5 in my_dict.keys():
        total_system = 0
        if (len(my_dict[md5]) == 1 and
                len(my_dict[md5][my_dict[md5].keys()[0]]['filenames']) == 1):
            # only have one type inode  - regarless of number of files, we
            # won't be making any space changes here - discard!
            print "passing"
            break

        total_size = 0
        filenames = []  # to collect file names from the various inodes

        for inode in my_dict[md5].keys():
            single_size = int(my_dict[md5][inode]['size'])
            total_size += single_size
            filenames.append(my_dict[md5][inode]['filenames'])
            print_debug("md5: {}, inode: {} entries: {}, size: {}"
                        .format(md5, inode,
                                len(my_dict[md5][inode]['filenames']),
                                single_size))

        saving_size = total_size - single_size
        print("total size for inode:{}, single_size:{}, saving_size:{}"
              .format(human_bytes(total_size), human_bytes(single_size),
                      human_bytes(saving_size)))
        print "filenames in cluster:{}".format(filenames)
        print "number of seperate inodes: {}".format(len(my_dict[md5][inode]))
        print "total number of files: {}".format(len(filenames))
        print "-"*50, "end of current md5"

        total_system += total_size
    print "\n\n\nTotal potential saving entire subtree: {}".format(human_bytes(total_system))
    """
if __name__ == '__main__':
    main()
