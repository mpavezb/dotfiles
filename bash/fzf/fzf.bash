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
# THEMES
# https://github.com/junegunn/fzf/wiki/Color-schemes
# ===============================================

mp_fzf_theme_jellyx() {
    FZF_DEFAULT_OPTS='
	--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
        --color info:150,prompt:110,spinner:150,pointer:167,marker:174
        --color preview-bg:234'
}

mp_fzf_theme_solarized() {
    FZF_DEFAULT_OPTS='
	--color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
  	--color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
	--color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07'
}

mp_fzf_theme_red() {
    FZF_DEFAULT_OPTS='
	--color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
	--color info:52,prompt:196,spinner:208,pointer:196,marker:208'
}

# default theme
mp_fzf_theme_jellyx

# ===============================================
# Options
# ===============================================
FZF_PREVIEW_OPTS=
FZF_PREVIEW_OPTS="${FZF_PREVIEW_OPTS} --preview='_mp-fzf_preview_command {}'"
FZF_PREVIEW_OPTS="${FZF_PREVIEW_OPTS} --preview-window='right:50%'"
FZF_PREVIEW_OPTS="${FZF_PREVIEW_OPTS} --bind pgdn:preview-page-down,pgup:preview-page-up"

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

# ===============================================
# Extra Tools
# ===============================================
source "${FZF_DIR}"/tools.bash

unset FZF_DIR
