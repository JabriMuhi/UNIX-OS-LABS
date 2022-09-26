#!/bin/bash

while true; do
	read line
	case "$line" in
		"TERM")
			kill -SIGTERM $1
			exit 
		;;
		"+")
			kill -USR1 $1
		;;
		"*")
			kill -USR2 $1
		;;
		*)
			continue
		;;
	esac
done
