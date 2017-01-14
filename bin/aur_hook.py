#!/usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable=no-member

"""
Simple command-line example for Custom Search.
Command-line application that does a search.

Create a file called .googleapikey in your API from google and place in the
root of your home directory
"""

import os
import re
import sys

from googleapiclient.discovery import build
from googleapiclient.errors import HttpError


def cleanhtml(raw_html):
    """ Remove html tags from string """

    cleanr = re.compile('<.*?>')
    cleantext = re.sub(cleanr, '', raw_html)
    return str(cleantext)


def main():
    """
    Conduct search using API Key
    Instructions can be found at: <http://code.google.com/apis/console>
    """

    if not len(sys.argv) == 2:

        sys.stderr.write('Please supply binary filename as parameter\n')
        sys.exit(1)
    try:
        home = os.getenv("HOME")
        key = open(home + '/.googleapikey', 'r').read()
    except IOError:
        print """
        Unable to open API Key, please create file ~/googleapikey, and ensure
        it has your API key from google.  For more information visit:
        http://code.google.com/apis/console>
        """

    service = build("customsearch", "v1", developerKey=key)

    try:
        res = service.cse().list(
            q='site:aur.archlinux.org/packages ' + '"' + sys.argv[1] + '"',
            cx='002948415325737835571:ruzeukdbft8',).execute()
    except HttpError as http_error:
        print "Unable to access service:"
        print http_error
        sys.exit(1)

    if 'items' not in res:
        sys.stderr.write('AUR: File not found\n')
        sys.exit(2)
    print cleanhtml(res['items'][0]['htmlTitle']).split()[-1]

if __name__ == '__main__':
    main()
