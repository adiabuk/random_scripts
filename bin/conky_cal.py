#!/usr/bin/env python2

"""
Displays current, previous, and next months
calendar for conky
"""

import calendar
import re
import sys
import time

months = [-1, 0, 1]

for month in months:
    localtime = time.localtime(time.time())
    calendar.setfirstweekday(calendar.MONDAY)
    cal = calendar.month(localtime[0], localtime[1] + month)
    parts = cal.split('\n')
    cal = '${alignc}${offset -8}' + '\n${offset 37}'.join(parts)

    regex = '(?<= )%s(?= )|(?<=\n)%s(?= )|(?<= )%s(?=\n)' % (
        localtime[2], localtime[2], localtime[2])
    if month == 0:
        replace = '${color1}%s${color white}' % localtime[2]
        newCal = re.sub(regex, replace, cal)
    else:
        newCal = cal
    print newCal
