#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "== Emacs settings installer === "

echo " - Creating '$HOME/.emacs.d/' dir."
mkdir -p ${HOME}/.emacs.d/

echo " - Linking emacs system: ${DIR} -- '$HOME/.emacs.d/mp'."
rm -f "${HOME}/.emacs.d/mp"
ln -sf ${DIR} "${HOME}/.emacs.d/mp"

echo " - Copying emacs entry point: '$HOME/.emacs.d/init.el' file."
cp ${DIR}/home.el $HOME/.emacs.d/init.el

echo " - OK - "
