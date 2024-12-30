[
  "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false" # Fixes slow ghostty window launches
  "swww-daemon &"
  "wpdefault"

  "uwsm app -- nm-applet --indicator &"
  "uwsm app -- blueman-applet &"
  "uwsm app -- wl-gammarelay-rs &"
  "uwsm app -- waybar &"

  "hyprctl setcursor BreezeX-RosePine-Linux 20"
]
