#!/bin/bash

# ===============================================
# Shell Options
# ===============================================

# shell options
shopt -s autocd         # change to named directory
shopt -s checkwinsize   # rearrange lines on window resize
shopt -s histappend     # do not overwrite history.
shopt -s histverify     # verify selected history command before running.
shopt -s cmdhist        # save multi-line commands as single line.
shopt -s cdspell        # autocorrects cd misspellings
shopt -s dirspell       # corrects dirs during word completion.
shopt -s expand_aliases # expand aliases.
shopt -s dotglob        # include '.*' filenames in expansions.

# ignore duplicates and commands starting with spaces
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=10000
export HISTFILESIZE=20000

# Set emacs mode in bash
set -o emacs

# ===============================================
# EDITOR/VISUAL
# ===============================================
# Set the default editor to emacs.
EDITOR=
VISUAL=
if which emacsclient >/dev/null; then
    # -t: open in terminal mode
    # -c: run in new frame
    # -a: start emacs if there is no server
    export ALTERNATE_EDITOR=""
    EDITOR="emacsclient -t"
    VISUAL="emacsclient -c -a emacs"
elif which subl >/dev/null; then
    EDITOR="subl"
elif which vi >/dev/null; then
    EDITOR="vi"
fi
export EDITOR
export VISUAL

# ===============================================
# Man Pager
# ===============================================
if which bat > /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
