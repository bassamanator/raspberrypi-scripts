#!/bin/bash 
# This script write to file the temperature of your Raspberry Pi once every 
# second until you stop it with Ctrl+c. Temperature will also be printed on
# screen.
# Example log: Temp-06-36-47-AM--21-Jun-2020.txt. Created in the current 
# working directory.
# Author: Bassam Husain; bassamanator
# https://github.com/bassamanator/raspberrypi-scripts

# Choose where you would like to save the log.
#filename=/path/to/folder/Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt
filename=Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt

echo Filename: $filename
echo "Temperature (°C)" | tee -a $filename
while true 
 do
	cpu=$(cat /sys/class/thermal/thermal_zone0/temp)
	echo $(($cpu / 1000)) | tee -a $filename
     sleep 1
 done
