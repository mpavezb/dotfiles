#!/bin/bash

# ===============================================
# System Management
# ===============================================

# grub
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# processes
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# hardware info
alias hw="hwinfo --short"

# ===============================================
# Usability
# ===============================================
# Fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias gti='git'

# Readable Outputs
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'

