#!/bin/bash

ps -Ao pid,command | tail -n +2 | awk '{if ($2 ~ /^\/sbin\//)print $1}' > all_pid.txt
