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

import Queue
import json
import os
import sys
import threading
import time
import __builtin__

from optparse import OptionParser
from filestructure import FileStructure
from debug import print_debug
from processthreads import FileThread

CURRENT_DIR = os.getcwd()
__builtin__.exitFlag = 0





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
    global threads
    threads = options.threads
    ignore_dot_files = options.ignore_dot_files
    ignore_dot_dirs = options.ignore_dot_dirs

    max_count = threads
    threadList = list("Thread {}".format(x) for x in range(max_count))
    global queueLock
    __builtin__.queueLock = threading.Lock()
    __builtin__.workQueue = Queue.Queue(100000000)  # 100 million
    threads = []
    threadID = 1


    print "Generating Threads"
    # Create new threads
    for tName in threadList:
        thread = FileThread(threadID, tName, __builtin__.workQueue)
        thread.start()
        threads.append(thread)
        threadID += 1

    top = CURRENT_DIR

    # Acquire file list
    print "Getting file list"
    queueLock.acquire()
    for (dirname, dirs, files) in os.walk(CURRENT_DIR):
        dirs[:] = [d for d in dirs if not d[0] == '.'] if ignore_dot_dirs else dirs
        files = [f for f in files if not f[0] == '.'] if ignore_dot_files else files

        for filename in files:
            #os.chdir(dirname)
            print_debug(dirname + '/' + filename)
            fullpath = dirname + '/' + filename
            __builtin__.workQueue.put(fullpath)

            # add all your operations for the current job in the directory
            # Now go back to the top of the chain
            #os.chdir(top)
    queueLock.release()

    initial_qsize = float(__builtin__.workQueue.qsize())

    def print_progress():
        """ poor man's progress overview """

        remaining = float(initial_qsize - __builtin__.workQueue.qsize())
        perc = int((remaining/initial_qsize)*100)
        print("progress: " +  str(remaining).strip() + '/' +
              str(initial_qsize).strip() + ' :' +
              str(perc).strip() + '%')

    print "Getting file metadata\n"
    # Wait for queue to empty
    while not workQueue.empty():
        print_progress()
        time.sleep(1)

    print_progress()

    # Notify threads it's time to exit
    __builtin__.exitFlag = 1
    print_debug("I am here")

    # Wait for all threads to complete
    for t in threads:
        t.join()

    print_debug("Exiting Main Thread")

    my_dict = dict(FileStructure().get())

    print "removing non repeated files from consideration"
    del my_dict['0']
    keys_to_delete = ['0']
    for key, value in my_dict.iteritems():
        if len(value.keys()) == 1:
            keys_to_delete.append(key)
    for key in keys_to_delete:
        try:
            del my_dict[key]
        except KeyError:
            pass
    sys.exit() #############################


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
