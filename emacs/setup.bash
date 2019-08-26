#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "== Emacs settings installer === "

echo " - Creating '$HOME/.emacs.d/' dir."
mkdir -p ${HOME}/.emacs.d/

echo " - Linking settings scripts: '$HOME/.emacs.d/settings/' --> ${DIR}/settings/."
ln -sf ${DIR}/settings/ ${HOME}/.emacs.d/

echo " - Copying emacs entry point: '$HOME/.emacs.d/init.el' file."
cp $DIR/init.el $HOME/.emacs.d/

echo " - OK - "
