#!/bin/bash

# add/del changes to subversion

for toadd in `svn status |grep '?'|awk {'print $2'}`; do svn add "$toadd"; done
for todel in `svn status |grep '!'|awk {'print $2'}`; do svn del "$todel"; done

