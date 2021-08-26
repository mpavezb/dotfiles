#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ===============================================
# Environment variables
# ===============================================
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${THIS_DIR}/init/environment.sh"

# ===============================================
# Shell Options
# ===============================================
source "${DOTFILES}/bash/init/options.bash"

# ===============================================
# Prompt
# ===============================================
source "${DOTFILES}/bash/prompt.bash"

# ===============================================
# Bash completion
# ===============================================
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# ===============================================
# Fuzzy Matcher
# ===============================================
source "${DOTFILES}/bash/fzf/fzf.bash"

# ===============================================
# Bash aliases
# ===============================================
source "${DOTFILES}/bash/init/bash_aliases.bash"

# ===============================================
# Emacs
# ===============================================
source "${DOTFILES}/emacs/setup.bash"