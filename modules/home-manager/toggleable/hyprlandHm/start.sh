#!/usr/bin/env sh

uwsm app -- swww-daemon &
sleep 0.1
wpdefault

uwsm app -- waybar &
uwsm app -- nm-applet --indicator &
uwsm app -- blueman-applet &
uwsm app -- wl-gammarelay-rs &

hyprctl setcursor BreezeX-RosePine-Linux 20
