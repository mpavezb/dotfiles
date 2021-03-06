#!/bin/bash
# Issues:
# - Update to use it on another repo.
# - Check not a git repository.
# - Already set to X, want to change?
#
# Usage:
#   bash $DOTFILES/git/config_local.bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${DIR}"
git config --local user.name "Matias Pavez"
git config --local user.email "matias.pavez.b@gmail.com"
git config --local credential.helper "cache --timeout=864000"

# Display local config with indentation
git config --list --local | paste /dev/null -

