#!/bin/bash

# ==============================================================================
# GIT FZF
# ==============================================================================
# See: https://stackoverflow.com/a/37007733/2873320

mp::is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

mp::git_status() {
  mp::is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

mp::git_branch() {
  mp::is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

mp::git_tags() {
  mp::is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

mp::git_commits() {
  mp::is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

mp::git_remotes() {
  mp::is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}

# Note that redraw-current-line is not necessary if you're on tmux.
bind '"\er": redraw-current-line'
bind '"\C-g\C-f": "$(mp::git_status)\e\C-e\er"'
bind '"\C-g\C-b": "$(mp::git_branch)\e\C-e\er"'
bind '"\C-g\C-t": "$(mp::git_tags)\e\C-e\er"'
bind '"\C-g\C-h": "$(mp::git_commits)\e\C-e\er"'
bind '"\C-g\C-r": "$(mp::git_remotes)\e\C-e\er"'


# ==============================================================================
# BAZEL FZF
# ==============================================================================
mp::bazel_targets() {
    bazel query ... |
    fzf --height 40% --ansi --no-sort --reverse
}
bind '"\C-b\C-t": "$(mp::bazel_targets)\e\C-e\er"'

# ==============================================================================
# Autocompletion
# ==============================================================================
# source $DOTFILES/bash/fzf/complete.bash
