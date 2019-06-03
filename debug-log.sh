#!/bin/bash

# script for export ALL debug logs to a subdirectory
# named "log".  
#
# it requires the "force" CLI tool be available and
# assumes the user is already logged in.
#
# Sure, I could have added more debugging, like checking
# to see if the user was logged in, but I didn't have 
# all night. ;-)
#
# 2017-08-29 tggagne@gmail.com

for each in $(./force query "select id from apexlog"); do
	log=$(echo $each | sed -e 's/"//g')
	
	if [ "$log" == "Id" ]; then
		echo "ignoring $log"
		continue
	fi

	echo "writing log/$log.debug"
	./force log $log > log/$log.debug
done