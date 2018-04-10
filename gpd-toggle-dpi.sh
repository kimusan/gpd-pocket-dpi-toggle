#!/bin/bash
####################################################################################################
# simple script to toggle dpi using either xfconf-query (xfce) or xrandr.
# Script is made by Kim Schulz <kim@schulz.dk> / https://github.com/kimusan) / https://schulz.kim
####################################################################################################
if [[ "x$1" == "x" ]]; then
	echo "Please specify method to use (xrandr or xfce)"
	exit 1
fi
if [ ! -f "~/.gdp-toggle-dpi-xrandr" ]; then
	touch ~/.gdp-toggle-dpi-xrandr
fi
if [[ "$1" == "xrandr" ]]; then 
	echo "using xrandr"
	FULL="1x1"
	HALF="0.64x0.64"
	CURRENT="$(cat ~/.gpd-toggle-dpi-xrandr|grep "${HALF}")"
	DISP="$(xrandr -q|grep primary|cut -f 1 -d " ")"
	COMMAND="xrandr --output ${DISP} --scale "
elif [[ "$1" == "xfce" ]]; then
	FULL="100"
	HALF="150"
	CURRENT="$(xfconf-query -c xsettings -p /Xft/DPI|grep "${HALF}")"
	COMMAND="xfconf-query -c xsettings -p /Xft/DPI -s "
else
	echo "Please specify method to use (xrandr or xfce)"
	exit 1
fi	
	
if [[ "x${CURRENT}" == "x" ]]; then
	echo -n "Switching to low res..."
	echo "${HALF}" > $HOME/.gpd-toggle-dpi-xrandr
	${COMMAND} ${HALF}
	echo "done"
else
	echo -n "switching to high res..."
	${COMMAND} ${FULL}
	echo "${FULL}" > ~/.gpd-toggle-dpi-xrandr
	echo "done"
fi
