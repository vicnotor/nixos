#[ PATH
# set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/personal/bin" ] ; then
#     PATH="$HOME/personal/bin:$PATH"
# fi

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && uwsm check may-start; then
    exec uwsm start -S hyprland-uwsm.desktop
fi

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty2 ]; then
  exec Hyprland
fi
