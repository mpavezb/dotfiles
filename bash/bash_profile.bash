#!/bin/bash

# Load .profile, containing login, non-bash related initializations.
[[ -f ~/.profile ]] && source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Start X server if needed
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
