#!/bin/bash
ipmitool sdr elist | awk -F '|' '{print $2}' | sed 's/h//1' > sensorhexid
for i in $(cat sensorhexid)
do
	printf "sensor ID is $i \n"
	ipmitool sdr elist | grep $i
        printf "ipmitool raw 0x04 0x21 0x00 0x00 0x$i 0x00 0x00 0xff"	
	ipmitool raw 0x04 0x21 0x00 0x00 0x$i 0x00 0x00 0xff > sdrraw
	readtype=$(cat sdrraw | awk '{print $6}' | sed -n "1,1p")
	entityid=$(cat sdrraw | awk '{print $11}' | sed -n "1,1p")
	entity=$(cat sdrraw | awk '{print $12}' | sed -n "1,1p")
	sensortype=$(cat sdrraw | awk '{print $15}' | sed -n "1,1p")
	readingtype=$(cat sdrraw | awk '{print $16}' | sed -n "1,1p")
	printf "read type is $readtype \n"
	printf "entity id is $entityid \n"
	printf "entity is $entity \n"
	printf "sensor type is $sensortype \n"
	printf "reading type is $readingtype \n"
done