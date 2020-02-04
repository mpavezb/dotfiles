#!/bin/bash
# This file is the entry point for interactive-login shells.

# Load interactive/login related initializations.
[[ -f ~/.profile ]] && source ~/.profile

#  Load interactive/non-login related initializations.
[[ -f ~/.bashrc ]] && source ~/.bashrc

