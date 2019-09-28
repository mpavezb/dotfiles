#!/bin/bash
# prompt for bash
# (by mpavezb)
#
# TO DO:
# - git merge/rebase
# - coloring for default terminal and my terminal
# - show username@hostname and path in tab name

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

# color table
function __color_black    { echo "\[\e[30m\]$1\[\e[0m\]"; }
function __color_red      { echo "\[\e[31m\]$1\[\e[0m\]"; }
function __color_green    { echo "\[\e[32m\]$1\[\e[0m\]"; }
function __color_yellow   { echo "\[\e[33m\]$1\[\e[0m\]"; }
function __color_blue     { echo "\[\e[34m\]$1\[\e[0m\]"; }
function __color_magenta  { echo "\[\e[35m\]$1\[\e[0m\]"; }
function __color_cyan     { echo "\[\e[36m\]$1\[\e[0m\]"; }
function __color_lgray    { echo "\[\e[37m\]$1\[\e[0m\]"; }
function __color_dgray    { echo "\[\e[90m\]$1\[\e[0m\]"; }
function __color_lred     { echo "\[\e[91m\]$1\[\e[0m\]"; }
function __color_lgreen   { echo "\[\e[92m\]$1\[\e[0m\]"; }
function __color_lyellow  { echo "\[\e[93m\]$1\[\e[0m\]"; }
function __color_lblue    { echo "\[\e[94m\]$1\[\e[0m\]"; }
function __color_lmagenta { echo "\[\e[95m\]$1\[\e[0m\]"; }
function __color_lcyan    { echo "\[\e[96m\]$1\[\e[0m\]"; }
function __color_white    { echo "\[\e[97m\]$1\[\e[0m\]"; }

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
    local EXIT_CODE="$1"    
    if [ "${EXIT_CODE}" = 0 ]; then
	#__format_bold "$(__color_lgreen "[^-^]]/°")";
	echo ""
    else
        #__format_bold "$(__color_lred "(${EXIT_CODE})..[x-x]]/°!!")";
	__format_bold "$(__color_lred "(${EXIT_CODE})")";
    fi
}

function __prompt_git {
    local MSG
    if git status &>/dev/null; then
	MSG=$(git status)
	
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
    fi
}

__prompt_command() {
    local EXIT="$?"
    PS1=""
    PS1+="$(__prompt_retcode $EXIT)"
    PS1+="$(__format_bold "[")"
    PS1+="$(__prompt_time)"
    #PS1+=" $(__prompt_username)"
    #PS1+="@$(__prompt_hostname)"
    PS1+=":$(__prompt_path)"
    PS1+="$(__format_bold "]")"
    PS1+="$(__prompt_git)"
    PS1+=" $(__prompt_symbol) "
}
PROMPT_COMMAND=__prompt_command
