#!/bin/bash
# Sets emacs env configs.
# 
# This file is autoloaded by bash

# Emacs Doom
if [ -d ~/.emacs_ws/doom/distro/bin/ ] && [ -d ~/.emacs_ws/doom/config ]
then
    export DOOMDIR=~/.emacs_ws/doom/config
    export PATH=~/.emacs_ws/doom/distro/bin/:$PATH    
fi
