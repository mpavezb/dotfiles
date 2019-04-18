#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp $DIR/config.sh $HOME/.config/i3/config
i3-msg reload
# i3-msg restart