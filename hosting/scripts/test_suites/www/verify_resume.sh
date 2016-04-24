#!/bin/bash

source ../configure.sh


#start_server || die "Failed to start Selenium Server"
(
perl perl/verify_resume.pl 157 Jay 19.00
perl perl/verify_resume.pl 158 edward 26.00
perl perl/verify_resume.pl 159 Brian 23.00
perl perl/verify_resume.pl 161 edward 28.00
) 2>&1 |tee /var/log/amrox/$0.log || die "Check permissions on /var/amrox"

stop_server || die "Failed to stop Selenium server"
