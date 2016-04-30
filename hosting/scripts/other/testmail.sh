#!/bin/bash

# Small test script to test in/out bound mail traffic

   (
        sleep 1
        echo "ehlo localhost"
        sleep 1
        echo "mail from:amro.diab@amroxonline.com"
        sleep 1
        echo "rcpt to:amro.diab@amroxonline.com"
        sleep 1
        echo "data"
        sleep 1
        echo "subject:Test message"
        sleep 1
        echo "Hello."
        sleep 1
        echo "This is a test message."
        sleep 1
        echo "Bye."
        sleep 1
        echo "."
        sleep 1
        echo "QUIT"
   ) | telnet localhost 25

