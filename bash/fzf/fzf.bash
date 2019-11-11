#!/bin/bash

# ==============================================================================
# Command Line Helpers
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


# # ==============================================================================
# # Autocompletion
# # ==============================================================================
# # See: https://github.com/junegunn/fzf/wiki/examples
# # See: https://github.com/junegunn/fzf/wiki/Examples-(completion)
# _fzf_complete_git() {
#     ARGS="$@"
#     local branches
#     branches=$(git branch -vv --all)
#     if [[ $ARGS == 'git co'* ]]; then
#         _fzf_complete "--reverse --multi" "$@" < <(
#             echo $branches
#         )
#     else
#         eval "zle ${fzf_default_completion:-expand-or-complete}"
#     fi
# }

# _fzf_complete_git_post() {
#     awk '{print $1}'
# }
# # Not Working
# # complete -F _fzf_complete_git -o default -o bashdefault git


# # Custom fuzzy completion for "doge" command
# #   e.g. doge **<TAB>
# _fzf_complete_doge() {
#   _fzf_complete "--multi --reverse" "$@" < <(
#     echo very
#     echo wow
#     echo such
#     echo doge
#   )
# }
# # Not Working
# # complete -F _fzf_complete_doge -o default -o bashdefault doge
