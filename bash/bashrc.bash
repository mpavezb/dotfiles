#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ===============================================
# Shell Options
# ===============================================
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

# ===============================================
# Custom Includes
# ===============================================
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

# environment variables
source $DOTFILES/bash/environment.sh

# Prompt for bash and git  
source $DOTFILES/bash/prompt.bash

# Add bash aliases.
source $DOTFILES/bash/bash_aliases.bash

# Enable programmable completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# Fuzzy Matcher
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
    source $DOTFILES/bash/fzf/fzf.bash
fi
