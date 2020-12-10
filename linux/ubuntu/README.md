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

Most of the setup must be performed manually. Laptop or desktop specific configurations are indicated when required.

### Required Packages

```bash
# Record system changes
sudo apt install etckeeper

# General Tools
sudo apt install curl apt-transport-https htop git

# Development
sudo apt install clang-format emacs shellcheck
```

### Dotfiles

```bash
# Get
git clone https://github.com/mpavezb/dotfiles .dotfiles
```

### Ubuntu Settings

- **Power Settings** 
  - > Power Saving > Blank Screen > Never
  - (laptop) > Suspend & Power Button > Automatic Suspend > When on battery power (30 min), Plugged (NO)
- **Privacy Settings**
  - > Screen Lock > Off
  - > Problem Reporting > Sends reports automatically ON.
- **Region & Language**
  - > Language: English (United States)
  - > Input Sources:
	- Enable English and Spanish keyboards.
	- Options: Use the same source for all windows.
- **Removable Media**
  - > Never prompt or start programs on media insertion.
- **Search**: Disable: Files, Characters. TODO: calendar? calculator? passwords? terminal?


### Tweaks and Extensions

```bash
sudo apt install chrome-gnome-shell gnome-tweak-tool
```
**Tweaks**
- > Top Bar > Enable Clock Date / Weekday  
- (laptop) > Top Bar > Battery Percentage
- > Workspaces > Static Workspaces / Number of Workspaces=9

**Gnome Extensions**: Enable the following extensions
- Extensions: https://extensions.gnome.org/extension/1036/extensions/
- Desktop Icons (native):
  - Show Home, Hide other.
- Alt Tab Workspace: https://extensions.gnome.org/extension/310/alt-tab-workspace/
- Workspace Matrix: https://extensions.gnome.org/extension/1485/workspace-matrix/
  - Set workspaces to 9.
- Sound Output Device Chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
- Open Weather: https://extensions.gnome.org/extension/750/openweather/
  - Set City and units.
- Bluetooth Quick Connect: https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/


### Misc Settings

```bash
# XDG user dirs
bash ~/.dotfiles/linux/ubuntu/xdg/setup.bash
```

These other setup procedures are also not yet automated:
- **Disable Terminal Bell**: Terminal > Edit > Preference: Uncheck Terminal Bell.
- **Nautilus Markers**: Add markers to important folders
  - workspaces
  - downloads
  - documents
  - HDDs

## Applications

These applications must be installed manually:
- Discord: https://discord.com/download
- Inkdrop: https://my.inkdrop.app/download
- Skype: https://www.skype.com/en/get-skype/
- Spotify: https://www.spotify.com/us/download/linux/
- Sublime Text 3: https://www.sublimetext.com/3

Whenever a debian package needs to be manually installed, prefer `sudo apt install ./<package>.deb` instead of `sudo dpkg -i <package>.deb`, to ensure no broken deps.

TODO:
- fzf
- ripgrep: https://github.com/BurntSushi/ripgrep
- virtualenv
- blacken
- bat
- ...

### TODO: Default applications

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
