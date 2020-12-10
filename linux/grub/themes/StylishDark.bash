#!/bin/bash
# 
# Usage:
# $ cd <this-directory> # (IMPORTANT!)
# $ bash StylishDark.bash

# Check root access
ROOT_UID=0
if [ "$UID" -eq "$ROOT_UID" ]; then

  # Create themes directory if not exists
  echo "Checking for the existence of themes directory..."
  mkdir -p /boot/grub/themes

  # Copy StylishDark
  echo "Installing Vimix theme..."
  cp -a StylishDark /boot/grub/themes

  # Set StylishDark
  echo "Setting Vimix as default..."
  grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
  echo "GRUB_THEME=\"/boot/grub/themes/StylishDark/theme.txt\"" >> /etc/default/grub

  # Update grub config
  echo "Updating grub config..."
  grub-mkconfig -o /boot/grub/grub.cfg

else
    # Error message
    echo "Root access is required."
fi
