#!/bin/bash

at now + 2 minutes -f ./ping_test.sh
tail -n0 -f ~/report

