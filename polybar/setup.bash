#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEST=$HOME/.config/polybar

rm -rf $DEST
mkdir -p $DEST

# launcher
cp $DIR/launch.bash $DEST

# configuration script
cp $DIR/config.ini $DEST/config

# hardware
cp $DIR/modules/cpu.ini              $DEST/
cp $DIR/modules/memory.ini           $DEST/
cp $DIR/modules/temperature.ini      $DEST/
cp $DIR/modules/filesystem.ini       $DEST/
cp $DIR/modules/battery.ini          $DEST/
cp $DIR/modules/pulseaudio.ini       $DEST/

# tools
cp $DIR/modules/powermenu.ini        $DEST/
cp $DIR/modules/date.ini             $DEST/
cp $DIR/modules/xkeyboard.ini        $DEST/
cp $DIR/modules/mpd.ini              $DEST/

# DS and WM
cp $DIR/modules/i3.ini               $DEST/
cp $DIR/modules/xwindow.ini          $DEST/

# backlight
cp $DIR/modules/backlight.ini        $DEST/
cp $DIR/modules/backlight.sh         $DEST/

# networking
cp $DIR/modules/wired-network.ini    $DEST/
cp $DIR/modules/wireless-network.ini $DEST/

# vpn
cp $DIR/modules/nordvpn.ini          $DEST/
cp $DIR/modules/nordvpn.sh           $DEST/


