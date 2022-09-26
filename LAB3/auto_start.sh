#!/bin/bash

crontab << "*/5 * * * 1 ./ping_test.sh"
