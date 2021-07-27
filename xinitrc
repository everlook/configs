#!/bin/sh

export MONITOR=eDP-1

picom -b &

xset -dpms
xset s 1800 1800

xsetroot  -cursor_name  left_ptr

exec bspwm
