# Ubuntu

## Overview

- [Health Check](#health-check)
- [Setup](#setup)
- [Applications](#applications)
- [Troubleshooting](#troubleshooting)

## Health Check

- Network: Wifi/Eth
- Audio: Speakers/Headset/Mic
- Other: Brightness, Battery, Touchpad, Mouse
- Dual-Boot: Does this affect other checks?

## Setup

### Required Packages

```bash
# Record system changes
sudo apt install etckeeper

# General Tools
sudo apt install curl apt-transport-https htop git

# Desktop Settings
sudo apt install chrome-gnome-shell gnome-tweak-tool

# Development
sudo apt install clang-format emacs shellcheck
```

The following tools must be installed manually:
- ripgrep: https://github.com/BurntSushi/ripgrep
- virtualenv
- blacken
- bat
- ...

### Dotfiles

```bash
# Get
git clone https://github.com/mpavezb/dotfiles .dotfiles

# XDG user dirs
bash ~/.dotfiles/linux/ubuntu/xdg/setup.bash
```

### Manual Setup

These setting procedures must be performed manually:
- **Power Settings** 
  - > Power Saving > Blank Screen > Never
- **Privacy Settings**
  - > Screen Lock > Off
  - > Problem Reporting > Sends reports automatically ON.
- **Region & Language**
  - > Language: English (United States)
  - > Input Sources:
	- Enable English and Spanish keyboards.
	- Options: Use the same source for all windows.
- **Search**: Disable Ubuntu Software.	

These other setup procedures are also not yet automated:
- **Disable Terminal Bell**: Terminal > Edit > Preference: Uncheck Terminal Bell.
- **gnome tweak tool**
  - Desktop -> Home, Mounted Volumes
  - Top Bar -> Enable Clock Date
- **Nautilus Markers**: Add markers to important folders
  - workspaces
  - downloads
  - documents
  - HDDs
- **Gnome Extensions**: Enable the following extensions
  - Extensions: https://extensions.gnome.org/extension/1036/extensions/
  - Alt Tab Workspace: https://extensions.gnome.org/extension/310/alt-tab-workspace/
  - Workspace Matrix: https://extensions.gnome.org/extension/1485/workspace-matrix/
  - Sound Output Device Chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/

## Applications

These applications must be installed manually:
- Discord: https://discord.com/download
- Inkdrop: https://my.inkdrop.app/download
- Skype: https://www.skype.com/en/get-skype/
- Spotify: https://www.spotify.com/us/download/linux/
- Sublime Text 3: https://www.sublimetext.com/3

Whenever a debian package needs to be manually installed, prefer `sudo apt install ./<package>.deb` instead of `sudo dpkg -i <package>.deb`, to make ensure no broken deps.

## Troubleshooting

### grub-repair

First, install both Windows and Linux and modify the BIOS to only allow UEFI boots.

Boot from a linux live CD, install boot-repair and use it.

```bash
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt install  boot-repair
boot-repair
```

### nvidia

```bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install nvidia-driver-440 nvidia-settings
```

### Xorg

Check for Xorg login errors:

```bash
cat ~/.local/share/xorg/Xorg.0.log | grep EE
```
