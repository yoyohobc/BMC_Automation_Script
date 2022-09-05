#!/bin/bash
ipmitool sdr elist | awk -F '|' '{print $1}' | sed 's/[ \t]*$//g' > sensorname
IFS=$'\n'
for i in $(cat sensorname)
# unr ucr unc lnc lcr lnr
do
	printf "sensor name is $i \n"
        ipmitool sensor get $i | sed 's/na/0/1' > $i
	LNC=$(cat $i | grep "Lower Non-Recoverable" | awk -F : '{print $2}')
	LCR=$(cat $i | grep "Lower Critical" | awk -F : '{print $2}')
	LNR=$(cat $i | grep "Lower Non-Critical" | awk -F : '{print $2}')
        UNC=$(cat $i | grep "Upper Non-Critical" | awk -F : '{print $2}')
	UCR=$(cat $i | grep "Upper Critical" | awk -F : '{print $2}')
	UNR=$(cat $i | grep "Upper Non-Recoverable" | awk -F : '{print $2}')
	LNC2=$(echo "$LNC * 2" | bc)
	LCR2=$(echo "$LCR * 2" | bc)
	LNR2=$(echo "$LNR * 2" | bc)
	UNC2=$(echo "$UNC * 0.14" | bc)
	UCR2=$(echo "$UCR * 0.14" | bc)
	UNR2=$(echo "$UNR * 0.14" | bc)
#	ipmitool sensor thresh "$i" lnc $LNC2
#ipmitool sensor thresh "$i" lower $LNR2 $LCR2 $LNC2
#	sleep 5
#	ipmitool sensor thresh "$i" lcr $LCR2
#	sleep 5
#	ipmitool sensor thresh "$i" lnr $LNR2
 #       sleep 5
	ipmitool sensor get "$i"
#sleep 13
#	ipmitool sel elist
#ipmitool sensor thresh "$i" lower $LNR $LCR $LNC
#sleep 13
#ipmitool sel elist
#ipmitool sensor thresh "$i" upper $UNC2 $UCR2 $UNR2
#sleep 13
#ipmitool sel elist
#ipmitool sensor thresh "$i" upper $UNC $UCR $UNR
#sleep 13
#ipmitool sel elist
#        ipmitool sensor thresh "$i" lnc $LNC
#	sleep 5
#	ipmitool sensor thresh "$i" lcr $LCR
#	sleep 5
#	ipmitool sensor thresh "$i" lnr $LNR
#	sleep 5
#	ipmitool sensor thresh "$i" unr $UNR2
#	sleep 5
#	ipmitool sensor thresh "$i" ucr $UCR2
#	sleep 5
#	ipmitool sensor thresh "$i" unc $UNC2
#	sleep 5
#	ipmitool sensor thresh "$i" unr $UNR
#	sleep 5
#	ipmitool sensor thresh "$i" ucr $UCR
#	sleep 5
#	ipmitool sensor thresh "$i" unc $UNC
#	sleep 5
done



