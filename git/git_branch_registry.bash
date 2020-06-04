#!/bin/bash
#
# usage: git_branch_registry.bash
#
# dependencies:
# sudo apt-get install python3.X-venv

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

VENV_PATH=${HOME}/.opt/venv/dotfiles
VENV_ACTIVATE_PATH=${VENV_PATH}/bin/activate

# create virtualenv if needed
if [ ! -f ${VENV_ACTIVATE_PATH} ]; then
    echo "creating venv: ${VENV_PATH}"
    mkdir -p ${VENV_PATH}/..
    python3 -m venv ${VENV_PATH}
    echo ""
fi
source ${VENV_ACTIVATE_PATH}

# install gitpython
if [ ! -d ${VENV_PATH}/lib/python3.6/site-packages/git/ ]; then
    pip3 install gitpython
    echo ""
fi

python3 ${THIS_DIR}/git_branch_registry.py $@

deactivate
