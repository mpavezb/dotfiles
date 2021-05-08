# Linux

## Overview

- [Health Check](#health-check)
- [Setup](#setup)
- [Troubleshooting](#troubleshooting)

## Health Check

- Network: Wifi/Eth
- Audio: Speakers/Headset/Mic
- Other: Brightness, Battery, Touchpad, Mouse, Webcam
- Dual-Boot: Does this affect other checks?

## Setup

See the [installation document](INSTALL.md).

Resources:
- i3: https://i3wm.org/docs/
- Playerctl : https://github.com/altdesktop/playerctl
- rofi: https://github.com/davatorium/rofi
- Howdy: https://github.com/boltgolt/howdy (face recognition based login).

TODO:
- fzf
- ripgrep: https://github.com/BurntSushi/ripgrep
- virtualenv
- blacken
- bat
- ...


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
