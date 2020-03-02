#!/bin/bash

function mp::fzf_preview_file
{
    local path=$1

    [[ ! -f $path ]] && return

    if which bat >/dev/null; then
	bat \
	    --style="numbers,header" \
	    --map-syntax="h:cpp" \
	    --theme="TwoDark" \
	    --color=always \
	    "${path}" \
	    | head -100
    else
	head -100 "${path}"
    fi
}

function mp::fzf_preview_command
{
    local path=$1
    if [[ -d $path ]]; then
	echo -e "\e[1mDirectory:\e[0m"
	echo "$(readlink -f ${path})"
	echo ""
	echo -e "\e[1mContents:\e[0m"
	find "${path}" | head -100
    elif [[ -f $path ]]; then
	mp::fzf_preview_file "${path}"
    else
	echo "Path ${path} os not a file or directory!"
    fi
}
export -f mp::fzf_preview_file
export -f mp::fzf_preview_command
