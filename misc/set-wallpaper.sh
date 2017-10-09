#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gsettings set org.gnome.desktop.background picture-uri file://$DIR/wallpaper.jpg
