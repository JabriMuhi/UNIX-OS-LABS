#!/bin/bash

proc=$(ps -U user -o pid,command | tail -n +2 | sed -r "s/\s*([^ ]+)\s(.*)/\1:\2/")
lines_cnt=$(echo "$proc"|wc -l)
echo "Total count: $lines_cnt" > command_count.txt
echo -e "\n$proc" >> command_count.txt
