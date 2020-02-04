#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp $DIR/bash_profile.bash $HOME/.bash_profile
cp $DIR/bash_logout.bash  $HOME/.bash_logout
