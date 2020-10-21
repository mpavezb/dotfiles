#!/bin/bash

function _mp-fzf_preview_file
{
    local path=$1
    if hash bat 2>/dev/null; then
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

function _mp-fzf_preview_directory
{
    local path=$1
    echo -e "\e[1mDirectory:\e[0m"
    readlink -f "${path}"
    echo ""
    echo -e "\e[1mContents:\e[0m"
    find "${path}" | head -100
}

function _mp-fzf_preview_command
{
    local path=$1
    if [[ -d $path ]]; then
	_mp-fzf_preview_directory "${path}"
    elif [[ -f $path ]]; then
	_mp-fzf_preview_file "${path}"
    else
	echo "Path ${path} is not a file or directory!"
    fi
}
export -f _mp-fzf_preview_file
export -f _mp-fzf_preview_directory
export -f _mp-fzf_preview_command
