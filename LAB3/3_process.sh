#!/bin/bash

./3_process_1.sh&pid0=$!
./3_process_1.sh&pid1=$!
./3_process_1.sh&pid2=$!

cpulimit --pid=$pid0 --limit=10 &

at now + 1 minute <<< "kill ${pid2}"
at now + 2 minute <<< "kill ${pid0} ; kill ${pid1}"
