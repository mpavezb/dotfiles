#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo " - Installing emacs configuration into '$HOME/.emacs'."
cp $DIR/emacs     $HOME/.emacs

echo " - Creating '$HOME/.emacs.d/lisp/ directory."
mkdir -p $HOME/.emacs.d/lisp

echo " - Copying lisp scripts into .emacs.d/"
cp $DIR/lisp  -r  $HOME/.emacs.d/

echo "OK"