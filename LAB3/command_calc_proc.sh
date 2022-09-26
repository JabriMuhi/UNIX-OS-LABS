#!/bin/bash

cur=1
mode="+"

sig() {
	mode="TERM"
}

plus() {
	mode="+"
}

multiply() {
	mode="*"
}

trap 'sig' SIGTERM
trap 'plus' USR1
trap 'multiply' USR2

while true; do
	case "$mode" in
		"+")
			cur=$(echo "${cur} + 2" | bc)
		;;
		"*")
			cur=$(echo "${cur} * 2" | bc)
		;;
		"TERM")
			echo "Exit"
			exit
		;;
	esac
	sleep 1
	echo $cur
done
