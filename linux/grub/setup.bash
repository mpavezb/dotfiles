#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo cp $DIR/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
