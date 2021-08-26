#!/bin/bash
# Description:
#   Set personal git configurations to the current repository.
#
# Usage:
#   bash set_local_gitconfig.bash
#

# Imports
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTFILES="$(readlink -f ${SCRIPT_DIR}/..)"
source ${DOTFILES}/bash/tools/assertions.bash

# Checks
assert_in_git_repository

# Display local config with indentation
echo "Repository git config:"
git config --list --local | paste /dev/null -
echo "---"

# Set relevant config
git config --local user.name "Matias Pavez"
# git config --local user.email "matias.pavez.b@gmail.com"
git config --local user.email "14824728+mpavezb@users.noreply.github.com"
git config --local credential.helper "cache --timeout=864000"

# Display local config with indentation
echo "New local git config:"
git config --list --local | paste /dev/null -
echo "---"