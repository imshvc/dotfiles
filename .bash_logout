# file: .bash_logout
# desc: executed by bash when login shell exits

# when leaving the console clear
# the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
