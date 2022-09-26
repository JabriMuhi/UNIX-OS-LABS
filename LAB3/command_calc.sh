#!/bin/bash

./command_calc_proc.sh&pid=$!
./command_calc_gen.sh $pid

