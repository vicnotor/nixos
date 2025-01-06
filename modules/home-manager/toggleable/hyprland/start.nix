[
  # Fixes some apps with slow initial startup
  "[workspace special:firstlaunchapps silent] uwsm app -- $terminal"
  "[workspace special:firstlaunchapps silent] uwsm app -- $fileManager"
  "swww-daemon &"
  "wpdefault"

  "uwsm app -- nm-applet --indicator &"
  "uwsm app -- blueman-applet &"
  "uwsm app -- wl-gammarelay-rs &"
  "uwsm app -- waybar &"

  "hyprctl setcursor BreezeX-RosePine-Linux 20"
]
