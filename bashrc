# Useful aliases. Add these to the end of your ~/.bashrc file. Then
# type 'source ~/.bashrc' (without the quotes) in your terminal to 
# initialize them. When you're using these aliases, you can press
# tab after the first few letters and they'll be autocompleted for
# you.

# Shows the value of get_throttled live. Useful if you're running a 
# stress test and want to watch for throttling.
alias wthrottle="watch vcgencmd get_throttled"

# Shows live CPU temperature.
alias wtemp="watch -n 1 cat /sys/class/thermal/thermal_zone0/temp"

# Shows live CPU clock speed.
alias wspeed="watch -n 1 vcgencmd measure_clock arm"


