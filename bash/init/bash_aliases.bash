#!/bin/bash

# ===============================================
# System Management
# ===============================================
# update-grub
alias mp::update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# hardware info
alias mp::hw="hwinfo --short"

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

# shell
alias mp::clear="tput reset"
