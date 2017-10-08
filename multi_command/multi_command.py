#!/usr/bin/env python2
# PYTHON_ARGCOMPLETE_OK

"""
Easily run multiple shell commands in parallel and log to a file
Author: Amro Diab
Date: 09/03/2016
"""

import multiprocessing
import time
import os
import subprocess
import sys
import json
import argparse
import argcomplete

REAL_PATH = os.path.dirname(os.path.realpath(__file__))
example = open(REAL_PATH + '/example.txt', 'r').readlines()

def print_status(string):
    """ Only print if --quiet flag not specified """

    if not quiet:
        sys.stderr.write(string)

def work((index, cmd)):
    """
    Process a given command and return results as a dictionary: stdout,
    stderr, and command name with args
    """

    print_status("spawning process {}\n".format(index))
    the_time = 1

    try:
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE, shell=True)
    except OSError:
        sys.exit('failed: {}'.format(cmd))

    out = proc.stdout.read().strip()
    err = proc.stderr.read().strip()

    time.sleep(int(the_time))
    print_status("\t\t\tFinished process {}\n".format(index))
    return {index: {'out': out, 'err': err, 'command': cmd}}

def collect_results(lst):
    """ collate results into a dictonary """

    print "calling collector"
    print lst
    my_dict.update(lst)

def mp_handler():
    """
    handles the processes in the pool and prints results when complete
    """
    procs = []

    contents = open(commands, 'r').readlines()
    for index, command in enumerate(contents):
        procs.append((index+1, command.strip()))


    p = multiprocessing.Pool(processes)
    out = p.map(work, procs)
    my_dict = {}
    for item in out:
        my_dict.update(item)
    if pretty:
        print json.dumps(my_dict, sort_keys=True, indent=4, separators=(',', ': '))
    else:
        print json.dumps(my_dict)


def parse_options():
    """ parse commandline options """

    REAL_PATH = os.path.dirname(os.path.realpath(__file__))
    example = REAL_PATH + '/example.txt'

    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--commands", default=example,
                        help="file containing commands")
    parser.add_argument("-p", "--processes", default=5,
                        help="number of concurrent processes")
    parser.add_argument("-o", "--output", help="use https")
    parser.add_argument("-q", "--quiet", action="store_true",
                        help="don't display process information")
    parser.add_argument("-r", "--pretty", default=False,
                        help="pretty print json")

    argcomplete.autocomplete(parser)
    args = parser.parse_args()
    return args

if __name__ == '__main__':
    options = parse_options()
    processes = options.processes
    output = options.output
    quiet = options.quiet
    pretty = options.pretty
    if not os.path.isfile(options.commands):
        sys.exit("fail")
    else:
        commands = options.commands

    mp_handler()
