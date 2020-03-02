#!/bin/bash
# Provides FZF completion for bazel targets
# Completion is triggered by //.*<TAB>.
#
# See: https://github.com/junegunn/fzf/wiki/Examples-(completion)

# ===============================================
# Exit if bazel is not found
# ===============================================
if ! which bazel >/dev/null; then
    return
fi

# ===============================================
# Default Bazel Completion
# ===============================================
# if no completion is found, then load default one.
if ! complete -p | grep -q 'bazel'; then
    if [ -f /usr/local/lib/bazel/bin/bazel-complete.bash ]; then
	source /usr/local/lib/bazel/bin/bazel-complete.bash
    else
	# There is no bazel completion at this point.
	# Nothing to do about it.
	return
    fi
fi

# ===============================================
# FZF bazel autocompletion
# ===============================================
# Use FZF completion if current word starts with "//".
# Use _bazel__complete otherwise.

_fzf_complete_bazel() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    if [[ ${cur} =~ ^// ]]; then
	_fzf_complete "--multi --reverse" "$@" < <(
	    bazel query ... 2> /dev/null
	)
    else
	_bazel__complete
    fi
}

_fzf_complete_bazel_notrigger() {
    FZF_COMPLETION_TRIGGER='' _fzf_complete_bazel
}

complete -F _fzf_complete_bazel_notrigger -o nospace -o default -o bashdefault bazel
