#!/bin/bash
FZF_DIR="${DOTFILES}"/bash/fzf/

# fzf file exists
[[ ! -f ~/.fzf.bash ]] && return

# only if not in emacs
[[ ! -z ${INSIDE_EMACS+x} ]] && return

source ~/.fzf.bash
source "${FZF_DIR}"/git.bash
source "${FZF_DIR}"/bazel.bash
source "${FZF_DIR}"/complete.bash
