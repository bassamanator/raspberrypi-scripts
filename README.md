# raspberrypi-scripts
Author: Bassam Husain; bassamanator

Some useful scripts for your Raspberry Pi OS. I wrote this because I often stress test my Raspberry Pi with xhpl to check for stability after overclocking the CPU.

# Installation
Copy and paste the following line into your terminal. It will download and extract all the files to your ~/raspberrypi-scripts:

```git clone https://github.com/bassamanator/raspberrypi-scripts.git ~/raspberrypi-scripts```

## logtemp.sh
This script will write to file the temperature of your Raspberry Pi once every second until you stop it with Ctrl+c. The temperature will also be printed on screen. The log will be created in the directory from where you executed the script.
Example filename: Temp-06-36-47-AM--21-Jun-2020.txt. 

### If you would like to always save the temperature logs to a specific directory.
To save logs to a specific directory, uncomment (remove the # symbol) line A and change the path to where you would like to save the logs. Example: **filename=/home/pi/logs/Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt**. Follow that by commenting (add the # symbol) to line B. **Make these edits in your local copy of logtemp.sh; copying and pasting from here _will not work._**

**A.** #filename=/path/to/folder/Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt

**B.** filename=Temp-`date +%I-%M-%S-%p--%d-%b-%Y`.txt
