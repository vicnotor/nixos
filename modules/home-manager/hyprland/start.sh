#!/usr/bin/env bash

swww-daemon &
wpdefault

uwsm app -- nm-applet --indicator &
uwsm app -- blueman-applet &
uwsm app -- wl-gammarelay-rs &
uwsm app -- waybar &

hyprctl setcursor BreezeX-RosePine-Linux 20
