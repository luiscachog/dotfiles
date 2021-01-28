# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    history -w
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

save_history () {
echo Goodbye;
history -w
}
trap save_history EXIT
