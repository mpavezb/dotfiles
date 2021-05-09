#!/bin/sh

LOCK_IMG=/tmp/i3_lock_image.png
LOCK_ICON=~/.dotfiles/linux/scripts/lock-icon.png
SCALE1="10%"
SCALE2="1000%"

# capture screenshot
scrot "$LOCK_IMG"

# downsize and zoom to allow blur effect
convert $LOCK_IMG -scale $SCALE1 -scale $SCALE2 $LOCK_IMG
convert $LOCK_IMG $LOCK_ICON -gravity center -composite -matte $LOCK_IMG

# stop spotify
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

# TODO: mute system

# check
# eog $LOCK_IMG

# lock the screen
i3lock --nofork --show-failed-attempts --ignore-empty-password --image $LOCK_IMG

# TODO: revert music/volume back

# clean
rm -f $LOCK_IMG
