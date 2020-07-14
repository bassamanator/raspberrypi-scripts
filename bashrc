# Useful aliases. Add these to the end of your ~/.bashrc file. Then
# type 'source ~/.bashrc' (without the quotes) in your terminal to 
# initialize them. When you're using these aliases, you can press
# tab after the first few letters and they'll be autocompleted for
# you.

# Shows the value of get_throttled.
alias wthrottle="watch vcgencmd get_throttled"

# Shows current CPU temperature.
alias wtemp="watch -n 1 cat /sys/class/thermal/thermal_zone0/temp"

# Shows current CPU clock speed.
alias wspeed="watch -n 1 vcgencmd measure_clock arm"

# Shows current external IP.
alias getip="curl https://ipinfo.io/ip"

# Goes up a directory in your shell.
alias up="cd .."

# Show current bootloader version.
alias btlv="vcgencmd bootloader_version"

# A short from of 'ls -la'
alias l="ls -la"

