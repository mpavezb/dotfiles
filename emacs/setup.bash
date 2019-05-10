#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $HOME/.emacs.d/lisp

cp $DIR/emacs     $HOME/.emacs
cp $DIR/lisp  -r  $HOME/.emacs.d/

