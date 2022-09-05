#!/bin/bash

ls /sys/bus/i2c/devices/ > i2cdevice
for i in $(cat i2cdevice)
do
    hexdump -C /sys/bus/i2c/devices/$i/eeprom >> hexdumpresult
done
