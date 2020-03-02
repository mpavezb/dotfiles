#!/bin/bash
# Set up FZF Command Line Fuzzy Finder Utility
# - Load
# - Default Settings
# - Settings for default bindings
# - Bindings for git, bazel, ...
#
# See: man fzf
#

# ===============================================
# Loading
# ===============================================
# No fzf file
[[ ! -f ~/.fzf.bash ]] && return

# Don't load if running inside emacs
[[ ! -z ${INSIDE_EMACS+x} ]] && return

# Load
source ~/.fzf.bash

# ===============================================
# Utils
# ===============================================
FZF_DIR="${DOTFILES}"/bash/fzf
source "${FZF_DIR}"/utils.bash

# ===============================================
# Commands
# ===============================================
# Use fd as search engine (faster than find)
# https://github.com/sharkdp/fd
#
FZF_DEFAULT_COMMAND=
FZF_CTRL_T_COMMAND=
FZF_CTRL_R_COMMAND=
FZF_ALT_C_COMMAND=
if which fd > /dev/null; then
    COMMON_OPTS=" --color=never --hidden --follow --exclude .git"
    FZF_DEFAULT_COMMAND="fd --type f ${COMMON_OPTS} ."
    FZF_CTRL_T_COMMAND="fd --type f ${COMMON_OPTS} ."
    FZF_ALT_C_COMMAND="fd --type d ${COMMON_OPTS} ."
    unset COMMON_OPTS
fi
export FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND

# ===============================================
# Options
# ===============================================
FZF_PREVIEW_OPTS="--preview='mp::fzf_preview_command {}' --preview-window='right:50%'"

# Use JellyX Scheme
# https://github.com/junegunn/fzf/wiki/Color-schemes
FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
  --color preview-bg:234
'
FZF_CTRL_T_OPTS="--height 95% --multi ${FZF_PREVIEW_OPTS}"
FZF_CTRL_R_OPTS="--height 50% --border"
FZF_ALT_C_OPTS="--height 95% ${FZF_PREVIEW_OPTS}"

export FZF_DEFAULT_OPTS
export FZF_CTRL_T_OPTS
export FZF_CTRL_R_OPTS
export FZF_ALT_C_OPTS
unset FZF_PREVIEW_OPTS

# ===============================================
# Git
# ===============================================
source "${FZF_DIR}"/git.bash

# ===============================================
# Bazel
# ===============================================
source "${FZF_DIR}"/bazel.bash

unset FZF_DIR
