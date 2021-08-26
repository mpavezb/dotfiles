#!/bin/bash

# =============================================================================
# Notification
# ==============================================================================

# notify when command finishes
# (alert is defined in .bashrc)
echo "hello world"; alert

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

# all to null
echo "..." > /dev/null 2>&1
