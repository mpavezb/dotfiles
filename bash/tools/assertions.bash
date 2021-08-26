#!/bin/bash
#
# You can import this library as follows:
#
#   SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
#   DOTFILES="$(readlink -f ${SCRIPT_DIR}/..)"
#   source ${DOTFILES}/bash/tools/assertions.bash


assert_command_exists() {
    if ! command -v $1 &> /dev/null
    then
        echo "Required command could not be found: '$1'."
        exit 1
    fi
}

assert_file_exists() {
    if [ ! -f $1 ]
    then
        echo "Required file could not be found: '$1'."
        exit 1
    fi
}

assert_env_var_set() {
    local NAME=$1
    local VALUE=${!NAME}
    if [ -z "${VALUE}" ]
    then
        echo "Required env variable is not set or empty: '${NAME}'";
         exit 1
    fi
}

assert_in_git_repository() {
    if ! ([ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1); then
        echo "Current directory is not a git repository: $(pwd)"
        exit 1
    fi
}

# Tests
# export VAR2_NAME="hello world"
# export EMPTY_VAR=
# fail_on_missing_env_var VAR2_NAME
# fail_on_missing_env_var EMPTY_VAR
# fail_on_missing_env_var UNSET_VAR