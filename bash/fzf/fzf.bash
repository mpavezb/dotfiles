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
# Default Settings
# ===============================================

FZF_DEFAULT_COMMAND=

# Use JellyX Scheme
# https://github.com/junegunn/fzf/wiki/Color-schemes
FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
  --color preview-bg:234
'
export FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS

# ===============================================
# Default Bindings
# ===============================================
FZF_PREVIEW_OPTS="--preview='mp::fzf_preview_command {}' --preview-window='right:50%'"

FZF_CTRL_T_OPTS="--height 95% --multi ${FZF_PREVIEW_OPTS}"
FZF_CTRL_R_OPTS="--height 50% --border"
FZF_ALT_C_OPTS="--height 95% ${FZF_PREVIEW_OPTS}"

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
