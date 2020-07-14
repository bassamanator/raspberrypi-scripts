#!/bin/bash
# This script runs xhpl times and logs to output. You must have xhpl installed already
# second until you stop it with Ctrl+c. Temperature will also be printed on
# screen.
# Example log: Temp-06-36-47-AM--21-Jun-2020.txt. Created in the current 
# working directory.
# Author: Bassam Husain; bassamanator
# https://github.com/bassamanator/raspberrypi-scripts

# Choose where you would like to save the log.
#filename=$logsdir/xhpl/xhpl-`date +%I-%M-%S-%p--%d-%b-%Y`.txt
filename=xhpl-`date +%I-%M-%S-%p--%d-%b-%Y`.txt

inp=$1
re='^[0-9]+$'

if [ -z $inp ]
then
	num=1
elif ! [[ $inp =~ $re ]]
then
	echo "${1} is not a number."
	exit 1
else
	num=$inp
fi

echo $filename
vcgencmd measure_volts core | tee -a $filename
for (( n=1; n <= num; n++ )) 
do
	echo "***********************" | tee -a $filename
	echo "Starting run: ${n} of ${num}."  | tee -a $filename
	echo "***********************" | tee -a $filename
	min=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq)
	cur=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	max=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
	echo "Minimum Current Maximum" | tee -a $filename
	echo -e "  $(($min / 1000))     $(($cur / 1000))     $(($max / 1000))"  | tee -a $filename
	vcgencmd get_throttled  | tee -a $filename
	
	/opt/mpich/3.3.2/bin/mpirun -np 4 /opt/hpl/bin/xhpl | tee -a $filename
	echo "***********************"  | tee -a $filename
	echo "Run ${n} of ${num} completed."  | tee -a $filename
	echo "***********************"  | tee -a $filename
	min=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq)
	cur=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	max=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
	echo "Minimum Current Maximum" | tee -a $filename
	echo -e "  $(($min / 1000))     $(($cur / 1000))     $(($max / 1000))"  | tee -a $filename
	vcgencmd get_throttled | tee -a $filename
done
