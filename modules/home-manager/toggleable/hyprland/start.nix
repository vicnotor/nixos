[
  # Fixes some apps with slow initial startup
  "[workspace special:firstlaunchapps silent] uwsm app -- $terminal"
  "[workspace special:firstlaunchapps silent] uwsm app -- $fileManager"

  # Wallpaper
  "swww-daemon &"
  "wpdefault"

  # Other startup apps
  "uwsm app -- waybar &"
  "uwsm app -- nm-applet --indicator &"
  "uwsm app -- blueman-applet &"
  "uwsm app -- wl-gammarelay-rs &"

  # Cursor
  "hyprctl setcursor BreezeX-RosePine-Linux 20"
]
