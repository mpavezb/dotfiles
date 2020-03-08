#!/bin/bash
# Provides FZF completion for git branches.
# Completion is triggered with **<TAB>
#
# References:
# - https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# - https://github.com/junegunn/fzf/wiki/Examples-(completion)
#

# ===============================================
# Exit if default git autocompletion is missing
# ===============================================
# Git completion functions are loaded lazily!
# So an expression like the following will only
# work after lazy initialization completed.
# > if ! type -t __git_main >/dev/null; then
# >     return
# > fi
#
# This section forces early loading!.
# Thus, adding some initialization delay.
if ! type -t __git_main >/dev/null; then
    if [ -f /usr/share/bash-completion/completions/git ]; then
	source /usr/share/bash-completion/completions/git
    else
	return
    fi
fi

# ==============================================================================
# FZF git autocompletion
# ==============================================================================

# provide list of branches when trigger **<TAB> is used.
_fzf_complete_git() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    if [[ ${cur} = "**" ]]; then
	_fzf_complete "--height 40% --ansi" "$@" < <(
	    echo "  HEAD"
	    git branch -vv --all --color=always
	)
    else
	__git_main
    fi
}

# this postprocessing is only applied to _fzf_complete_git.
_fzf_complete_git_post() {
    local line branch
    read -r line
    branch=$(echo "${line}" | cut -d' ' -f 1)

    if [[ ${branch} = "*" ]]; then
	branch=$(echo "${line}" | cut -d' ' -f 2)
    fi
    if [[ ${branch} =~ ^remotes/ ]]; then
	branch=${branch#"remotes/"}
    fi
    echo "${branch}"
}

# Use git mechanism for autocompletion declarations
__git_complete git _fzf_complete_git
