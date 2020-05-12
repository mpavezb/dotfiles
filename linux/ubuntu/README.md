# Ubuntu Dotfiles

## Overview

- [Installation](#installation)
- [Setup](#tetup)
- [Tools](#tools)
- [Applications](#applications)

## Installation

### grub-repair

First, install both Windows and Linux and modify the BIOS to only allow UEFI boots.

Boot from a linux live CD, install boot-repair and use it.

```bash
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
boot-repair
```

### NVidia

```bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get-update
sudo apt install nvidia-driver-440 nvidia-settings
```

### Xorg

Check for Xorg login errors:

```bash
cat ~/.local/share/xorg/Xorg.0.log | grep EE
```

## Setup

- English/Spanish Keyboard
- xdg-user-dirs-update

### gnome tweak tool

```bash
sudo apt-get install gnome-tweak-tool
```
- Desktop -> Home, Mounted Volumes
- Top Bar -> Enable Clock Date

### Add markers to important folders

- workspaces
- downloads
- documents
- HDDs
   
## Tools

```bash
sudo apt get install htop

# TODO
virtualenv

sudo apt get install git
```

### Gnome Extensions

```bash
sudo apt-get install chrome-gnome-shell
```

- Extensions: https://extensions.gnome.org/extension/1036/extensions/
- Alt Tab Workspace: https://extensions.gnome.org/extension/310/alt-tab-workspace/
- Workspace Matrix: https://extensions.gnome.org/extension/1485/workspace-matrix/
- Sound Output Device Chooser: https://extensions.gnome.org/extension/906/sound-output-device-chooser/

## Applications

- Inkdrop
- Spotify
- Sublime Text 3
- Emacs
  - blacken
  - clang-format

