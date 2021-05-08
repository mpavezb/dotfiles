#!/bin/bash
#
# bash setup.bash
#
# Notes:
# The ~/Desktop folder must be deleted after a new login

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "======================"
echo " XDG user dirs update"
echo "======================"

echo " - Rename ~/Downloads to ~/downloads"
mkdir -p ~/downloads
if [ -d ~/Downloads ]; then
    cp -a ~/Downloads/. ~/downloads/
    rmdir ~/Downloads
fi

echo " - Hide default XDG dirs into ~/.ubuntu/"
mkdir -p ~/.ubuntu/
[ -d ~/Documents   ] && mv ~/Documents/ ~/.ubuntu/
[ -d ~/Music       ] && mv ~/Music/     ~/.ubuntu/
[ -d ~/Pictures    ] && mv ~/Pictures/  ~/.ubuntu/
[ -d ~/Public      ] && mv ~/Public/    ~/.ubuntu/
[ -d ~/Templates   ] && mv ~/Templates/ ~/.ubuntu/
[ -d ~/Videos      ] && mv ~/Videos/    ~/.ubuntu/

# Create placeholder for desktop
echo " - Create placeholder dir for Desktop"
mkdir -p ~/.ubuntu/Desktop

echo " - Updating XDG user dirs"
cp -f "${DIR}"/user-dirs.dirs ~/.config/user-dirs.dirs
xdg-user-dirs-update

echo " - Finished."
