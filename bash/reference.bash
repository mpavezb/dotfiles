#!/bin/bash
# bash tricks

# notify when command finishes
# (defined in .bashrc)
echo "hello world"; alert

# =============================================================================
# bash terminal commands
# https://ss64.com/bash/syntax-keyboard.html
# http://web.mit.edu/gnu/doc/html/features_7.html
# ==============================================================================
# C-x C-e : edit command in VISUAL
# See: bash terminal readline library
#

# =============================================================================
# Redirection
# ==============================================================================

# to file
echo "hello world" > file.log 2>&1

# to file and console
echo "hello world" 2>&1 | tee file.log

# pipe multiple commands to one
{ echo "hello"; echo "world"; } | nl
cat <(echo "hello") <(echo "world") | nl
