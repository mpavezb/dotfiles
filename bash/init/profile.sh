#!/bin/sh
#
# Executed by the command interpreter for login shells.
#
# ~/.profile is not read by bash, if ~/.bash_profile or ~/.bash_login
# exists.
#

if [ -n "$BASH_VERSION" ]; then
    # if running bash
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
else
    # Environment variables
    . environment.sh
fi

