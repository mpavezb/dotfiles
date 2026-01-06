# Install

## Overview

Most of the setup must be performed manually. Laptop or desktop specific configurations are indicated when required.

Whenever a debian package needs to be manually installed, prefer `sudo apt install ./<package>.deb` instead of `sudo dpkg -i <package>.deb`, to ensure no broken deps.

Table of Contents:
- [Required Packages](#required-packages)
- [Dotfiles](#dotfiles)
- [Ubuntu Settings](#ubuntu-settings)
- [Tweaks and Extensions](#tweaks-and-extensions)
- [Misc Settings](#misc-settings)
- [i3 and polybar setup](#i3-and-polybar-setup)

## Required Packages

```bash
# Record system changes
sudo apt install etckeeper

# General Tools
sudo apt install curl apt-transport-https htop git

# media
sudo apt install vlc ubuntu-restricted-extras imagemagick nautilus-image-converter

# vpn
# check webpage

# archive
sudo apt install rar unrar p7zip-full p7zip-rar

# battery life (laptop)
# https://linrunner.de/tlp/index.html
sudo apt install tlp tlp-rdw

# tweaks
sudo apt install chrome-gnome-shell gnome-tweak-tool

# Other Good to Have
sudo apt install gparted synaptic

# Development
sudo apt install clang-format emacs shellcheck

# i3 and polybar setup
sudo apt install i3          # i3
sudo apt install playerctl   # media player control using media keys
sudo apt install feh         # set background
sudo apt install arandr      # display configuration
sudo apt install rofi        # dmenu replacement
sudo apt install compton     # window composer: transparency and transition effects
sudo apt install i3lock      # lockscreen lock
sudo apt install scrot       # lockscreen screenshot
sudo apt install imagemagick # lockscreen blur
```

Polybar must be compiled from source. Please see the instructions on the [README](polybar/README.md).

## Dotfiles

```bash
# Get
git clone https://github.com/mpavezb/dotfiles .dotfiles
```

## Ubuntu Settings

- **Power Settings** 
  - Power Saving > Blank Screen > Never
  - (laptop) Suspend & Power Button > Automatic Suspend > When on battery power (30 min), Plugged (NO)
- **Privacy Settings**
  - Screen Lock > Off
  - Problem Reporting > Sends reports automatically > ON.
- **Region & Language**
  - Language: English (United States)
  - Input Sources:
    - Enable English and Spanish keyboards.
    - Options: Use the same source for all windows.
- **Removable Media**
  - Never prompt or start programs on media insertion.
- **Search**:
  - Disable All but Calculator and Applications (implicit).
- **Date & Time**
  - Automatic Date & Time > ON.
  - Automatic Time Zone > ON.
- **Displays**:
  - Night Light > ON

## Tweaks and Extensions

**Tweaks**
- Top Bar > Enable Clock Date / Weekday  
- (laptop) Top Bar > Battery Percentage
- Workspaces > Static Workspaces / Number of Workspaces=9

**Gnome Extensions**: Enable the following extensions
- Last checked in GNOME Shell 46.0 (2025) (`gnome-shell --version`). 
- Extensions: https://extensions.gnome.org/extension/1036/extensions/


Install These
- Workspace Matrix: https://extensions.gnome.org/extension/1485/workspace-matrix/
  - Set workspaces to 9.
- Weather O'Clock
  - https://extensions.gnome.org/extension/5470/weather-oclock/
  - `sudo apt install gnome-weather`
  - Then select weather location
- Dash to Dock: https://extensions.gnome.org/extension/307/dash-to-dock/
  - Position and Size > Position on screen: bottom.
  - Launchers > Show Trash Can [NO].
- Pomodoro:
  - `sudo apt install gnome-shell-pomodoro`


Needed but not available anymore (find a replacement)
- Sound Output Device Chooser
  - Unmaintained since 2022: https://extensions.gnome.org/extension/906/sound-output-device-chooser/

TODO
- [Not sure if needed] Alternate Tab:
  - Extension is not needed anymore. Read this: https://blogs.gnome.org/fmuellner/2018/10/11/the-future-of-alternatetab-and-why-you-need-not-worry/
  - Either AlternateTab: https://extensions.gnome.org/extension/15/alternatetab/
  - Or Alt Tab Workspace: https://extensions.gnome.org/extension/310/alt-tab-workspace/


**DNS**: Set up manual google DNS for every connection.
- Connection > IPV4 > Automatic (false) > 8.8.8.8,8.8.4.4


## Misc Settings

Hide default folders in home into `.ubuntu-default-folders/` folder. This requires logging out and then removing the `~/Desktop` folder by hand.
```bash
# XDG user dirs
bash ~/.dotfiles/linux/xdg/setup.bash
```

Hide remaining folders in home using the `.hidden` file. More info in [this thread](https://askubuntu.com/a/882622):
```bash
echo "snap" >> ~/.hidden
```

Create "Empty Document" shortcut
```bash
touch ~/.ubuntu-default-folders/Templates/Empty\ Document
```

These other setup procedures are also not yet automated:
- **Disable Terminal Bell**: Terminal > Edit > Preference: Uncheck Terminal Bell.
- **Nautilus Markers**: Add markers to important folders
  - workspaces
  - downloads
  - documents
  - HDDs

## Monitor Layouts

1. Use `arandr` (GUI tool for `xrandr`) to generate a valid `xrandr` configuration.
2. Save the configuration to `~/.config/xrandr/layout.sh`.
3. The script will be executed whenever i3 (re)loads.

## i3 and polybar setup

```bash
# i3 config
mkdir -p ~/.config/i3/
cd       ~/.config/i3/
ln -sf ~/.dotfiles/linux/i3/i3.cfg config

# Fonts
mkdir -p ~/.local/share/fonts
cp -rf ~/.dotfiles/linux/fonts/* ~/.local/share/fonts
fc-cache -f -v

# polybar
mkdir -p ~/.config/polybar/
cd       ~/.config/polybar/
ln -sf   ~/.dotfiles/linux/polybar/polybar.cfg config
ln -sf   ~/.dotfiles/linux/polybar/launch.bash launch.bash

# networkmanager_dmenu
mkdir -p ~/.config/networkmanager_dmenu/
cd       ~/.config/networkmanager_dmenu/
ln -sf   ~/.dotfiles/linux/network_manager/config.ini
#
mkdir -p ~/.local/share/applications/
cd       ~/.local/share/applications/
ln -sf   ~/.dotfiles/linux/network_manager/networkmanager_dmenu.desktop
#
mkdir -p ~/.local/bin/
cd       ~/.local/bin
ln -sf   ~/.dotfiles/linux/network_manager/networkmanager_dmenu
```

## Wallpaper

Getting Images:
0. Check saved wallpapers in GDrive.
1. Get images you like. You can use these services: https://unsplash.com/, http://simpledesktops.com/.
2. Copy them onto `~/.ubuntu-default-folders/Pictures/wallpaper/`.

### Using shotwell (ubuntu)

1. Import the folder to shotwell.
2. Select desired images.
3. File > Set wallpaper slideshow.

### i3 and feh

The i3 settings use the `feh` program to randomly pick images for every monitor on load.
