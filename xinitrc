#!/bin/sh

export MONITOR=eDP-1

picom -b &

xset -dpms

exec bspwm
