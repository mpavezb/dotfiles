#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DEST=$HOME/.config/polybar

rm -rf $DEST
mkdir -p $DEST
cp $DIR/config $DEST 
cp $DIR/launch.bash $DEST
