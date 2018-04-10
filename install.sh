#!/bin/bash
####################################################################################################
# simple installation script for gpd-toglle-dpi 
# Script is made by Kim Schulz <kim@schulz.dk> / https://github.com/kimusan) / https://schulz.kim
####################################################################################################
function usage(){
	echo ""
	echo "You need to specify if you are installing launcher for xrandr or xfconf-query (xfce)."
	echo " Arguments:"
	echo "   -e | --engine [xfce|xrandr] Specify which engine the launcer should use."
	echo "   -c | --color [black|white] Specify which color the icon for the launcer should be."
	echo "   -h | --help  This helpful info."
	echo "Usage example:"
	echo "   $0 -e xfce -c white"
    exit 0
}
OPTS=`getopt -o e:c:h --long engine:,color:,help: -- "$@"`
if [ $? != 0 ] ; then usage >&2 ; exit 1 ; fi
eval set -- "$OPTS"
#default values
engine="xfce"
color="black"
while true
do
  case "$1" in
    -e|--engine)
		engine="$2"
		((engine == "xfce" || engine == "xrandr")) || exit 1
		shift 2
      ;;
    -c|--color)
      color="$2"
		((color == "black" || color == "white")) || usage
      shift 2
      ;;
    -h|--help)
      usage
      break
      ;;
    --)
      shift
      break
      ;;
     *)
      usage
      exit 1
  esac
done

echo -n "Installing menu launcher for $lanucher..."
cat >$HOME/.local/share/applications/gpd-toggle-dpi.desktop <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=Toggle DPI (${engine})
Exec=gpd-toggle-dpi ${engine}
Icon=/usr/share/pixmaps/scale-screen-${color}.png
Categories=System;
EOL
echo "done"
echo -n "Installing icons..."
sudo cp scale-screen-*.png /usr/share/pixmaps/
echo "done"
echo -n "Installing command (gpd-toggle-dpi) into /usr/bin..."
sudo cp gpd-toggle-dpi.sh /usr/bin/gpd-toggle-dpi
echo "done"
