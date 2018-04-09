#!/bin/bash

CURRENT="$(xrandr --current|grep "primary 1229")"

if [[ "x${CURRENT}" == "x" ]]; then
	echo -n "Switching to low res..."
	xrandr --output DSI1 --scale 0.64x0.64
	echo "done"
else
	echo -n "switching to high res..."
	xrandr --output DSI1 --scale 1x1
	echo "done"
fi
