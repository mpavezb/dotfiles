#!/bin/bash

# ==============================================================================
# Autocompletion
# ==============================================================================
# See: https://github.com/junegunn/fzf/wiki/examples
# See: https://github.com/junegunn/fzf/wiki/Examples-(completion)

_fzf_complete_git() {
    ARGS="$@"
    local branches
    if [[ $ARGS == 'git checkout'* ]]; then
	branches=$(git branch -vv --all)
        _fzf_complete "--reverse --multi" "$@" < <(
            #     #echo $bcdranches
	    echo "ASD"
	    echo "Afghfg"
	    echo "asdf"
        )
    fi
}

# _fzf_complete_git_post() {
#     awk '{print $1}'
# }
#complete -F _fzf_complete_git -o default -o bashdefault git


doge() {
    echo "wof wof"
}

# Custom fuzzy completion for "doge" command
#   e.g. doge **<TAB>
_fzf_complete_doge() {
  _fzf_complete "--multi --reverse" "$@" < <(
    echo very
    echo wow
    echo such
    echo doge
  )
}
# Not Working
complete -F _fzf_complete_doge -o default -o bashdefault doge
