#!/usr/bin/env bash

uwsm app -- swww-daemon &
swww img ~/personal/Pictures/wallpapers/dune_2_top_down.jpeg &

uwsm app -- nm-applet --indicator &
uwsm app -- blueman-applet &
uwsm app -- wl-gammarelay-rs &
uwsm app -- waybar &

hyprctl setcursor BreezeX-RosePine-Linux 20
