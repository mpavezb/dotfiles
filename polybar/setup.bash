#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEST=$HOME/.config/polybar

rm -rf $DEST
mkdir -p $DEST

# launcher
cp $DIR/launch.bash $DEST

# configuration script
cp $DIR/config.ini $DEST/config

# modules
cp $DIR/modules/date.ini             $DEST/
cp $DIR/modules/battery.ini          $DEST/
cp $DIR/modules/wired-network.ini    $DEST/
cp $DIR/modules/wireless-network.ini $DEST/
cp $DIR/modules/xkeyboard.ini        $DEST/
cp $DIR/modules/powermenu.ini        $DEST/
cp $DIR/modules/cpu.ini              $DEST/
cp $DIR/modules/memory.ini           $DEST/
cp $DIR/modules/temperature.ini      $DEST/
cp $DIR/modules/filesystem.ini       $DEST/
cp $DIR/modules/pulseaudio.ini       $DEST/
cp $DIR/modules/i3.ini               $DEST/
cp $DIR/modules/mpd.ini              $DEST/
# cp $DIR/modules/backlight.ini        $DEST/
cp $DIR/modules/backlight.sh         $DEST/
cp $DIR/modules/backlight-scroll.ini $DEST/backlight.ini
cp $DIR/modules/xwindow.ini          $DEST/
cp $DIR/modules/nordvpn.ini          $DEST/
cp $DIR/modules/nordvpn.sh           $DEST/


