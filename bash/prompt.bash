#!/bin/bash
# Version: v1.4
# Author: mpavezb
# Description: Prompt for bash
#  Shows the following information:
#  - Return code
#  - Time in hh:mm:ss format.
#  - Username (disabled)
#  - Hostname (disabled)
#  - Path with compressed HOME and parent directories. e.g.:  ~/w/rust
#  - Git status: staged, modified, untracked, stash, diff to/from upstream.
#  - virtualenv environment if active.
#
# Provides:
#  - mp-prompt_command_toggle_git : toggle git information on/off for the current shell.
#
# Formatting:
# - Sequences must be escaped to avoid weird prompt problems.
#   - Surround sequences with \[  \].
#   - Only external brackets must be escaped.
# - Sequence format: \\033[48;5;95;38;5;214m Hello World \\033[0m
#   - \033 == \e defines a escaping sequence.
#   - 48;5;x: sets background color x.
#   - 38;5;x: sets foreground color x.
#   - m     : end of sequence
# - See the color codes using colors.bash script.
# - See also: https://misc.flogisoft.com/bash/tip_colors_and_formatting

# font style
function __format_reset { echo "\[\e[0m\]"; }
function __format_bold  { echo "\[\e[1m\]$1\[\e[0m\]"; }

# color table (only apply color to non empty strings)
function __color_black    { [ -z "$1" ] && echo "" || echo "\[\e[30m\]$1\[\e[0m\]"; }
function __color_red      { [ -z "$1" ] && echo "" || echo "\[\e[31m\]$1\[\e[0m\]"; }
function __color_green    { [ -z "$1" ] && echo "" || echo "\[\e[32m\]$1\[\e[0m\]"; }
function __color_yellow   { [ -z "$1" ] && echo "" || echo "\[\e[33m\]$1\[\e[0m\]"; }
function __color_blue     { [ -z "$1" ] && echo "" || echo "\[\e[34m\]$1\[\e[0m\]"; }
function __color_magenta  { [ -z "$1" ] && echo "" || echo "\[\e[35m\]$1\[\e[0m\]"; }
function __color_cyan     { [ -z "$1" ] && echo "" || echo "\[\e[36m\]$1\[\e[0m\]"; }
function __color_lgray    { [ -z "$1" ] && echo "" || echo "\[\e[37m\]$1\[\e[0m\]"; }
function __color_dgray    { [ -z "$1" ] && echo "" || echo "\[\e[90m\]$1\[\e[0m\]"; }
function __color_lred     { [ -z "$1" ] && echo "" || echo "\[\e[91m\]$1\[\e[0m\]"; }
function __color_lgreen   { [ -z "$1" ] && echo "" || echo "\[\e[92m\]$1\[\e[0m\]"; }
function __color_lyellow  { [ -z "$1" ] && echo "" || echo "\[\e[93m\]$1\[\e[0m\]"; }
function __color_lblue    { [ -z "$1" ] && echo "" || echo "\[\e[94m\]$1\[\e[0m\]"; }
function __color_lmagenta { [ -z "$1" ] && echo "" || echo "\[\e[95m\]$1\[\e[0m\]"; }
function __color_lcyan    { [ -z "$1" ] && echo "" || echo "\[\e[96m\]$1\[\e[0m\]"; }
function __color_white    { [ -z "$1" ] && echo "" || echo "\[\e[97m\]$1\[\e[0m\]"; }

# components
function __prompt_username { __format_bold "$(__color_lblue    "\u")"; }
function __prompt_hostname { __format_bold "$(__color_lblue    "\h")"; }
function __prompt_time     { __format_bold "$(__color_lmagenta "\t")"; }
function __prompt_symbol   { __format_bold "\$"; }

function __prompt_path     {
    local PPATH

    # replace $HOME by ~
    PPATH="${PWD/${HOME}/\~}"

    # keep first character for each dir.
    # also keep first letter for hidden directories
    PPATH="$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<<"${PPATH}")" 
    __format_bold "$(__color_lyellow   "${PPATH}")";
}

function __prompt_retcode  {
    local EXIT_CODE
    EXIT_CODE="$1"    
    if [ "${EXIT_CODE}" = 0 ]; then
	#__format_bold "$(__color_lgreen "[^-^]]/°")";
	echo ""
    else
        #__format_bold "$(__color_lred "(${EXIT_CODE})..[x-x]]/°!!")";
	__format_bold "$(__color_lred "(${EXIT_CODE})")";
    fi
}

function __prompt_git_upstream {
    local RET
    local N_AHEAD
    local N_BEHIND
    N_AHEAD="$(git status --ignore-submodules -sb | head -1 | grep -o "ahead [0-9]*"  | cut -d' ' -f2)"
    N_BEHIND="$(git status --ignore-submodules -sb | head -1 | grep -o "behind [0-9]*" | cut -d' ' -f2)"
    
    RET=""
    RET+="$(__color_blue  "${N_BEHIND}")"
    RET+="$(__color_green "${N_AHEAD}")"
    echo "${RET}"
}

function __prompt_git_stats {
    local RET
    local N_STAGED
    local N_MODIFIED
    local N_UNTRACKED
    local STASH_SIZE
    N_STAGED="$(git diff --numstat --cached --ignore-submodules  | wc -l)"
    N_MODIFIED="$(git diff --numstat --ignore-submodules | wc -l)"
    N_UNTRACKED="$(git status --ignore-submodules --porcelain 2>/dev/null | grep -c "^??")"
    STASH_SIZE="$(git stash list | wc -l)"

    N_STAGED=$(    [ "${N_STAGED}"    -eq 0 ] && echo "" || echo "+${N_STAGED}"    )
    N_MODIFIED=$(  [ "${N_MODIFIED}"  -eq 0 ] && echo "" || echo "+${N_MODIFIED}"  )
    N_UNTRACKED=$( [ "${N_UNTRACKED}" -eq 0 ] && echo "" || echo "?${N_UNTRACKED}" )
    STASH_SIZE=$(  [ "${STASH_SIZE}"  -eq 0 ] && echo "" || echo "!${STASH_SIZE}"  )
    
    RET=""
    RET+="$(__color_blue   "${N_STAGED}"    )"
    RET+="$(__color_yellow "${N_MODIFIED}"  )"
    RET+="$(__color_red    "${N_UNTRACKED}" )"
    RET+="$(__color_dgray  "${STASH_SIZE}"  )"
    echo "${RET}"
}

function __prompt_git_branch {
    local MSG
    MSG=$(git status --ignore-submodules)
    if echo "${MSG}" | grep "nothing to commit" > /dev/null 2>&1; then
	__color_lgreen "$(__git_ps1 " (%s)")";
    elif echo "${MSG}" | grep "Changes not staged for commit" > /dev/null 2>&1; then
	__color_lyellow "$(__git_ps1 " {%s}")";
    elif echo "${MSG}" | grep "Untracked files" > /dev/null 2>&1; then
	__color_lred "$(__git_ps1 " {%s}")";
    elif echo "${MSG}" | grep "Changes to be committed" > /dev/null 2>&1; then
	__color_lblue "$(__git_ps1 " {%s}")";
    else
	__color_lcyan "$(__git_ps1 " {%s}")";
    fi
}

__mp_prompt_command_git_enabled=true
function __prompt_git {
    local RET
    local UPSTREAM
    local STATS
    if [ ! "${__mp_prompt_command_git_enabled}" = true ]; then
	return
    fi
    if git status --ignore-submodules &>/dev/null; then
	RET+="$(__prompt_git_branch)"
        UPSTREAM="$(__prompt_git_upstream)"
	STATS="$(__prompt_git_stats)"
	if [ -n "${UPSTREAM}" ] || [ -n "${STATS}" ]; then
	    RET+="<${UPSTREAM}|${STATS}>"
	fi
	echo "${RET}"
    fi
}

__prompt_virtualenv() {
    # disable the default virtualenv prompt change
    export VIRTUAL_ENV_DISABLE_PROMPT=1

    # display if needed
    __color_lgreen ${VIRTUAL_ENV:+(venv:${VIRTUAL_ENV##*/})}
}

__prompt_command() {
    local EXIT="$?"
    PS1=""
    PS1+="$(__prompt_retcode $EXIT)"
    PS1+="$(__prompt_virtualenv)"
    PS1+="$(__format_bold "[")"
    PS1+="$(__prompt_time)"
    #PS1+=" $(__prompt_username)"
    #PS1+="@$(__prompt_hostname)"
    PS1+=":$(__prompt_path)"
    PS1+="$(__format_bold "]")"
    PS1+="$(__prompt_git)"
    PS1+=" $(__prompt_symbol) "
}

__timed_prompt_command() {
    time __prompt_command
}

mp-prompt_command_toggle_git() {
    if [ "${__mp_prompt_command_git_enabled}" = true ]; then
	__mp_prompt_command_git_enabled=false
    else
	__mp_prompt_command_git_enabled=true
    fi
}

#PROMPT_COMMAND=__timed_prompt_command
PROMPT_COMMAND=__prompt_command
