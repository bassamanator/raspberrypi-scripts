#!/bin/bash
#"--dry-run"
fn=/home/pi/logs/MAN-`date +%I-%M-%S-%p--%d-%b-%Y`.txt
dest=/media/diskName/backup

echo "[START]  $(date)" >> $fn
rsync "-avXP" "--info=progress2" "--no-i-r" "-R" "--exclude-from=/home/pi/scripts/exclude-PC.txt" "--delete-excluded" "--log-file=${fn}" "/home/pi" "${dest}"
echo "[END]  $(date)" >> $fn
echo $fn

