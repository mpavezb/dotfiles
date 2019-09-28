#!/bin/bash
# prompt for bash
#
# TO DO:
# - git features
# - coloring for default terminal and my terminal
# - show username@hostname and path in tab name

# font style
function __prompt_reset { echo "\[$(tput sgr0)\]"; }
function __prompt_bold  { echo "$(__prompt_reset)\[$(tput bold)\]$1$(__prompt_reset)"; }

# color table
function __color_black   { echo "\[$(tput setaf 0)\]$1"; }
function __color_red     { echo "\[$(tput setaf 1)\]$1"; }
function __color_green   { echo "\[$(tput setaf 2)\]$1"; }
function __color_yellow  { echo "\[$(tput setaf 3)\]$1"; }
function __color_blue    { echo "\[$(tput setaf 4)\]$1"; }
function __color_purple  { echo "\[$(tput setaf 5)\]$1"; }
function __color_cyan    { echo "\[$(tput setaf 6)\]$1"; }

# components
function __prompt_username { __prompt_bold "$(__color_blue   "\u")"; }
function __prompt_hostname { __prompt_bold "$(__color_blue   "\h")"; }
function __prompt_path     {
    local PPATH

    # replace $HOME by ~
    PPATH="${PWD/${HOME}/\~}"

    # keep first character for each dir.
    # also keep first letter for hidden directories
    PPATH="$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<<"${PPATH}")" 
    __prompt_bold "$(__color_yellow   "${PPATH}")";
}
function __prompt_time     { __prompt_bold "$(__color_purple "\t")"; }
function __prompt_symbol   { __prompt_bold "\$"; }
function __prompt_retcode  {
    local EXIT_CODE="$1"    
    if [ "${EXIT_CODE}" = 0 ]; then
	#__prompt_bold "$(__color_green "[^-^]]/°")";
	echo ""
    else
        #__prompt_bold "$(__color_red "(${EXIT_CODE})..[x-x]]/°!!")";
	__prompt_bold "$(__color_red "(${EXIT_CODE})")";
    fi
}
function __prompt_git {
    local MSG
    if git status &>/dev/null; then
	MSG=$(git status)
	
        if echo "${MSG}" | grep "nothing to commit" > /dev/null 2>&1; then
	    echo "\[\033[0;32m\]$(__git_ps1 " (%s)")";
	elif echo "${MSG}" | grep "Changes not staged for commit" > /dev/null 2>&1; then
	    echo "\[\033[0;93m\]$(__git_ps1 " {%s}")";

	elif echo "${MSG}" | grep "Untracked files" > /dev/null 2>&1; then
	    echo "\[\033[0;91m\]$(__git_ps1 " {%s}")";
	else
	    
	    echo "\[\033[0;92m\]$(__git_ps1 " {%s}")";
	fi
    fi
}

__prompt_command() {
    local EXIT="$?"
    PS1=""
    PS1+="$(__prompt_retcode $EXIT)"
    PS1+="$(__prompt_bold "[")"
    PS1+="$(__prompt_time)"
    #PS1+=" $(__prompt_username)"
    #PS1+="@$(__prompt_hostname)"
    PS1+=":$(__prompt_path)"
    PS1+="$(__prompt_bold "]")"
    PS1+="$(__prompt_git)"
    PS1+=" $(__prompt_symbol)"
    PS1+=" $(__prompt_reset)"
}
PROMPT_COMMAND=__prompt_command
