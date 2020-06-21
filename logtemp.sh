#!/bin/bash 
# This script will log the temperature of your Raspberry Pi 4 every 
# second until you stop it with Ctrl+c. The log will be created in
# the directory /home/pi/logs. Temperature will also be printed on 
# screen.
# Example: /home/pi/logs/temp-06-36-47-AM--21-Jun-2020.txt

fn=$HOME/logs/Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt
echo $fn
while true 
 do
     cat /sys/class/thermal/thermal_zone0/temp 2>&1 | tee -a $fn
     sleep 1
 done
