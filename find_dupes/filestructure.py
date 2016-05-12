
"""

Filestrcutre class and suporting functions for storing, sorting, extracting,
and manipulating file file attributes and other metadata

"""
import json

from debug import print_debug


class Singleton(type):
    """
    base singleton class to subclass from other classes
    """

    _instances = {}
    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(Singleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]


class FileStructure(dict):
    """
    main structure for storing details of all files in the filesystem
    """

    __metaclass__ = Singleton

    def __init__(self):

        self.my_dict = dict()
        super(FileStructure, self).__init__()

    def __getitem__(self, item):
        """ Fetch single attribute from object """
        # FIXME
        print "getting item {}".format(item)

        try:
            return self.my_dict
        except KeyError:
            print "poo"

    def __str__(self):
        """ how to print structure """

        print_debug("returning")
        return json.dumps(self.my_dict)



    def __setitem__(self, *args, **kwargs):
        """ set single item in the structure """

        print_debug("setting item")
        #self.my_dict=1
    def put(self, path, mhash, size, inode):
        """ Insert item into structure, given the path, md5 hash, size, and
        inode.  Checks will be made to ensure that if the md5 hash and/or inode
        provided already exists, we will not overwrite, but add this as a value
        in a nested dictionary to sort later
        """
        print_debug("putting size:{}, path:{},inode:{}".format(size, path,
                                                               inode))
        #print inode
        if not mhash in self.my_dict:
            print_debug('path not present')
            self.my_dict.update({mhash:dict()})
        else:
            #self.my_dict[mhash].update({'size': size})
            print_debug('path1 already present')
        if not inode in self.my_dict[mhash]:
            print_debug('path not present')
            self.my_dict[mhash].update({inode: {}})
            self.my_dict[mhash][inode].update({'filenames':[]})
        else:
            print_debug('path2 already present')
        self.my_dict[mhash][inode]['filenames'].append(path)
        self.my_dict[mhash][inode]['size'] = size

    def get(self):
        """ get entire object """
        return self.my_dict

