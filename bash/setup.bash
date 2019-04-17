#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp $DIR/bashrc $HOME/.bashrc
cp $DIR/profile $HOME/.profile
cp $DIR/bash_profile $HOME/.bash_profile
cp $DIR/bash_aliases $HOME/.bash_aliases
cp $DIR/bash_logout $HOME/.bash_logout