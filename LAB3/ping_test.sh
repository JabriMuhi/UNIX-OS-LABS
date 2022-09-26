#!/bin/bash

start_date=$(date '+%d.%m.%y_%H:%M:%S')

mkdir ~/test && { echo "catalog test was created successfully" > ~/report ; touch ~/test/$start_date ; }
ping -c1 www.net_nikogo.ru || echo "${start_date} no response from host" >> ~/report
