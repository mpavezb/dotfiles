#!/bin/bash
#
# bash ~/.dotfiles/bash/setup.bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp $DIR/init/bash_logout.bash  $HOME/.bash_logout
