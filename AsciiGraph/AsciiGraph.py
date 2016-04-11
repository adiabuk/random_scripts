#!/usr/bin/python3


"""
Small app to render sets of coordinates to ASCII line art.
Input when prompted as follows: (x1, y1)-(x2, y2)
where x1, y1 are the xy coordinates of the the 1st coordinate and
x2, y2 are the 2nd coordinates.  Any spaces will be ignored.

NOTE:
For the '-' (minus) character, ensure you use the minus key on the keyboard
(ascii key 45) , and not the ascii key 150 dash character which will be used
if you manually copy/paste example coordinates from instruction pdf document.

the x range is 0 to 19 and y is 0 to 9
eg...
(4, 9)-(14, 0)

Multiple point sets can be input resulting in multiple graphs.
eg...
(4, 9)-(14, 0), (0, 4)-(19, 4)

"""

import sys
import re

def get_numbers(section):
    """
    Validate a given set of x, y cordinates and
    return 2 integer tuples representing the 2 points
    """
    p = re.compile(r"\((\d+),(\d)\)\s*\-\s*\((\d+),(\d+)\)")
    x1 = int(p.match(section).group(1))
    y1 = int(p.match(section).group(2))
    x2 = int(p.match(section).group(3))
    y2 = int(p.match(section).group(4))

    # Validate coordinates and return appropriate error
    if not 0 <= x1 <= 19 and 0 <= x2 <= 19:
        sys.exit('X values need to be within range 0 and 20, exiting...')
    elif not 0 <= y1 <= 9 and 0 <= y2 <= 9:
        sys.exit('Y values need to be within range 0 and 19, exiting...')

    return ((x1, x2), (y1, y2))

def get_y_coord(slope, x, yIntercept):
    """ return the rounded y coordinate for a given x coordinate """
    return round(slope * x + yIntercept) # y = mx + b


# Wait for input
print('Please enter coordinates and press enter...')
stdin = sys.stdin.readline()

# Remove spaces here to make our regexes simpler
formatted = stdin.replace(' ', '')

# Initialize 20 x 10 matrix
# We will leave everything empty for now to save resources.
# When printing the matrix later, any unpopulated cells will be replaced
# with spaces
Matrix = [['' for y in range(10)] for x in range(20)]

# Extract each set of 2 coordinates
groups = re.findall(r"\(\d+,\d\)\-\(\d+,\d+\)", formatted)
if not groups:
    sys.exit('No valid coordinates found')

for group in groups:
    (x1, x2), (y1, y2) = get_numbers(group)

    try:
        slope = ((y2-y1)/(x2-x1))  # m = dy / dx
        yIntercept = y1 - slope * x1  # m = y1 - mx1
    except ZeroDivisionError:  # Straight vertical line
        pass

    if x1 == x2: # x is static
        if y2 > y1: # increasing y
            for i in range(y1, y2):
                Matrix[x1][i] = 'x'

        else: # decreasing y
            for i in range(y1, y2, -1):
                Matrix[x1][i] = 'x'

    elif x2 > x1: # increasing x
        for i in range(x1, x2 + 1):
            new_y = get_y_coord(slope, i, yIntercept)
            Matrix[i][new_y] = 'x'

    else:  # decreasing x
        for i in range(x1, x2 -1, -1):
            new_y = get_y_coord(slope, i, yIntercept)
            Matrix[i][new_y] = 'x'

# Draw Matrix
for y in range(0, 10):
    for x in range(0, 20):
        if Matrix[x][y]:
            sys.stdout.write(Matrix[x][y]) # print populated cell
        else:
            sys.stdout.write(' ') # empty cells replaces with spaces

sys.stdout.write('\n') # end of row - start a new line
