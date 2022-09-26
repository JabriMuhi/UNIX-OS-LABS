#!/bin/bash

mkfifo pipe0

./calc_proc.sh&
./calc_gen.sh

rm pipe0
