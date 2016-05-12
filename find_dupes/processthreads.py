"""

Main thread and thread handling functions for extracting of file metadata and
adding to a Queue

"""

import time
import threading
import os
import hashlib
from debug import print_debug
from filestructure import FileStructure


class FileThread(threading.Thread):
    """
    Main thread for handeling file metadata extraction methods
    """

    def __init__(self, threadID, name, file_queue):
        """ Initialize the queue """

        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.file_queue = file_queue

    def run(self):
        """ Start the queue """
        print_debug("Starting " + self.name)
        self.process_data(self.name, self.file_queue)
        print_debug("Exiting " + self.name)

    def process_data(self, threadName, file_queue):
        """ retrieve a file from the queue, while locking, and sent for
        processing
        """

        while not exitFlag:
            queueLock.acquire()
            if not workQueue.empty():
                data = file_queue.get()
                queueLock.release()
                print_debug("%s processing %s" % (threadName, data))
                self.scan_files(data)
            else:
                queueLock.release()
            print_debug("end of process data")
            time.sleep(1)

    def scan_files(self, filename):
        """
        Extract size, inode, md5 sum from given file and add to structure
        """

        my_dict = FileStructure()

        path = filename
        if os.path.isfile(path):
           # try:
           #     mhash = self.md5(path)
           # except (IOError, OSError):
           #     print_debug('Error accessing {}'.format(path))
           #     return
            size = os.path.getsize(path)
            inode = os.stat(path).st_ino
            my_dict.put(str(path), str(size), str(inode))
            print_debug('updating for {}'.format(path))
        else:
            print_debug('{} is not a file'.format(path))

    def md5(self, filename):
        return filename    #temp
        """ get the md5 check sum of a given file """
        hash_md5 = hashlib.md5()
        with open(filename, "rb") as file_handle:
            for chunk in iter(lambda: file_handle.read(16384), b""):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()


