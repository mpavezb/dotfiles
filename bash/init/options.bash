#!/bin/bash

# shell options
shopt -s autocd         # change to named directory
shopt -s checkwinsize   # rearrange lines on window resize
shopt -s histappend     # do not overwrite history.
shopt -s cmdhist        # save multi-line commands as single line.
shopt -s cdspell        # autocorrects cd misspellings
shopt -s dirspell       # corrects dirs during word completion.
shopt -s expand_aliases # expand aliases.
shopt -s dotglob        # include '.*' filenames in expansions.

# ignore duplicates and commands starting with spaces
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=10000
export HISTFILESIZE=20000

# Set the default editor to vim.
export EDITOR=emacsclient
