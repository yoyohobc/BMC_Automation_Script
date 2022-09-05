#!/bin/bash
trap 'echo -e "\n$BASH_COMMAND"' DEBUG
gsys fan set /phys/BIGGULP:device:fan0 pwm 2
sleep 10s
gsys fan set /phys/BIGGULP:device:fan0 auto

ipmitool sel elist