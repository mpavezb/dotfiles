#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

# ===============================================
# Environment variables
# ===============================================
source $DOTFILES/bash/init/environment.sh

# ===============================================
# Shell Options
# ===============================================
source $DOTFILES/bash/init/options.bash

# ===============================================
# Prompt
# ===============================================
source $DOTFILES/bash/prompt.bash

# ===============================================
# Bash completion
# ===============================================
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# ===============================================
# Fuzzy Matcher
# ===============================================
if [ -f ~/.fzf.bash ]; then
    if [[ ${SHELLOPTS} =~ (vi|emacs) ]]; then
	source ~/.fzf.bash
	source "${DOTFILES}"/bash/fzf/fzf.bash
    fi
fi

# ===============================================
# Bash aliases
# ===============================================
source $DOTFILES/bash/init/bash_aliases.bash
