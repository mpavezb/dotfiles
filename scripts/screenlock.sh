#!/bin/sh
# Description:
#   Locks the screen using i3lock.
#
# Usage:
#   bash screenlock.sh
#

# Imports
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTFILES="$(readlink -f ${SCRIPT_DIR}/..)"
source ${DOTFILES}/bash/tools/assertions.bash

# Settings
LOCK_IMG=/tmp/i3_lock_image.png
LOCK_ICON="${DOTFILES}/scripts/screenlock-icon.png"
SCALE1="10%"
SCALE2="1000%"

# Assertions
assert_env_var_set DOTFILES
assert_command_exists amixer
assert_command_exists convert
assert_command_exists dbus-send
assert_command_exists i3lock
assert_command_exists scrot
assert_file_exists ${LOCK_ICON}

# Tooling
was_spotify_playing=0
pause_spotify() {
    status=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'| grep -E -A 1 "string"| cut -b 26- | cut -d '"' -f 1| grep -E -v ^$)
    if [ "$status" = "Playing" ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
        was_spotify_playing=1
    fi
}

revert_spotify() {
    if [ $was_spotify_playing -eq 1 ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play
    fi
}

was_sound_unmuted=0
mute_alsa() {
    if amixer -q -D pulse | head -n 7 | grep -q '\[on\]'; then
        amixer -q -D pulse sset Master mute
        was_sound_unmuted=1
    fi
}

revert_mute_alsa() {
    if [ $was_sound_unmuted -eq 1 ]; then
        amixer -q -D pulse sset Master unmute
    fi
}

# capture screenshot
scrot "$LOCK_IMG"

# downsize and zoom to allow blur effect
convert $LOCK_IMG -scale $SCALE1 -scale $SCALE2 $LOCK_IMG
convert $LOCK_IMG $LOCK_ICON -gravity center -composite -matte $LOCK_IMG

# mute / stop music
mute_alsa
pause_spotify

# lock the screen
i3lock --nofork --show-failed-attempts --ignore-empty-password --image $LOCK_IMG
# eog $LOCK_IMG

# revert sound
revert_mute_alsa
revert_spotify

# clean
rm -f $LOCK_IMG
