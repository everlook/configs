#!/bin/sh

export MONITOR=eDP-1

picom -b &

exec bspwm
