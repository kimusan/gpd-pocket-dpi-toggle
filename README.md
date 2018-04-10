# GPD Pocket DPI Toggle Script
This is a simple script to toggle between high and lower dpi in linux using xrandr or xfconf-query 
(in XFCE4). Perfect to use in a panel launcher or similar.
The script was originally made to be used in the small GPD Pocket computers when running linux
(hence the name). 

It is however not using any special features of that computer, so 

---
## installation
Installation is easy:
```bash
 ./install.sh -e|--engine [xrandr|xfce] -c | --color [black|white]

possible arguments:
  -e | --engine [xfce|xrandr] sets the "engine" to use in the launcher (default: xfce)
  -c | --color  [black|white] sets the icon color for the launcer (default: black)
```
 This will install the command as gpd-toggle-dpi in /usr/bin, add icons to /usr/share/pixmaps and
 created a menu item "Toggle DPI ('engine')" for the script.

 Example:
```bash
 ./install.sh --engine xfce -c white
```

 This will install the script and create the app launcher that uses xfconf-query. The icon is set
 to the white version. 

 **NOTE:** the script will ask for you sudo password when running, so make sure you remember this.

## Usage:
The script is available as gpd-toggle-dpi. It requires one argument to set which method you want to
use - xrandr or xfce (xfconf-query)

Example:
´´´bash
gpd-toggle-dpi xfce
´´´

Run it again to toggle back.


**Enjoy!**
---

## Credits:
* Script is made by Kim Schulz <kim@schulz.dk> / [github.com/kimusan](https://github.com/kimusan) / [schulz.kim](https://schulz.kim)
* Icons are made by [Freepik](http://www.freepik.com) from [Flaticon](https://www.flaticon.com/) and they are licensed by [CC 3.0 BY](http://creativecommons.org/licenses/by/3.0/)
