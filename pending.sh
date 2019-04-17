
# install
pacman -S powerline
yay -S powerline-fonts-git

# .bashrc
# powerline fonts
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
