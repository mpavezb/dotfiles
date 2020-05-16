#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${DIR}"
git config --local user.name "Matias Pavez"
git config --local user.email "matias.pavez.b@gmail.com"
git config --local credential.helper "cache --timeout=864000"

# Display local config with indentation
git config --list --local | paste /dev/null -

