#!/usr/bin/env bash
#
# dependencies:
# sudo apt install i3lock
# sudo apt install imagemagick
# sudo apt install scrot
#
# then add something like this to your shortcuts:
# name     : "i3 Screen Lock"
# command  : bash $HOME/workspace/dotfiles/i3/screen_lock.bash
# shortcut : Super + K


LOCK_IMG=/tmp/pixel_lock.png
SCALE1="5%" SCALE2="2000%"

# capture screenshot
scrot "$LOCK_IMG"

# downsize and zoom to allow blur effect
convert $LOCK_IMG -scale $SCALE1 -scale $SCALE2 $LOCK_IMG
#eog $LOCK_IMG

# lock the screen
i3lock --nofork --no-unlock-indicator --ignore-empty-password --image $LOCK_IMG
rm -f $LOCK_IMG
