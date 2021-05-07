# Polybar

```
==========================================================

   mpavezb
   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

==========================================================
```
See: https://github.com/jaagr/polybar

## Desired Features

- Date, Time
- Calendar
- Weather data
- Keyboard Layout: en/es
- Insync status
- Sound Devices:
  - Current Input / Output devices
  - Choose  Input / Output devices
  - Current Input / Output Volume
- Network:
  - Eth, Wifi Icons
  - Select Network
  - Turn Off network
  - Settings
- Bluetooth
  - Icon
  - On/Off
  - Settings
- Settings Button
- Powermenu
  - Lock
  - Power Off
  - Logout


## TO DO

Urgent:
- Fix power menu
- Removable Drive Menu

Small Points:
- Add warning icons.
- Battery: charging icon.
- Battery alt - remaining time
- Backlight with mininum value to 10%.
- Open system monitor when clicking cpu,mem,filesystem

Important:
- spacing between indicators.
- Change foregrounds by state.
- Wifi Icon Dissapears.
- Menu for date with calendar.
- Menu for Sound with input devices.
- Menu for Network .. Connect, Disconnect, ... like Ubuntu menu. 
- Wired network: Invalid network interface. Enable Autoconnect!
- interfaces estaticas
- Wifi alt - IP
- Wired alt - IP

Future:
- Same theme for UI
- Music module. MPD
- Important apps
  - spotify
  - firefox
  - skype
  - MEGA
  - Dropbox


## Install

Must be compiled from source on Ubuntu 20.04. See also: https://github.com/polybar/polybar/wiki/Compiling.

### Dependencies

```bash
# Build Dependencies
sudo apt install build-essential clang-10 git pkg-config python3 python3-sphinx python3-packaging 

# Build/Run Dependencies
sudo apt install libcairo2-dev                       # cairo
sudo apt install libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev  # libxcb
sudo apt install python3-xcbgen xcb-proto            # xcb-proto
sudo apt install libxcb-image0-dev                   # xcb-util-image
sudo apt install libxcb-ewmh-dev libxcb-icccm4-dev   # xcb-util-wm

# Optional Dependencies
sudo apt install libxcb-xrm-dev       # ${xrdb:...}
sudo apt install libxcb-cursor-dev    # cursor-click, cursor-scroll
sudo apt install libxcb-xkb-dev       # internal/keyboard
sudo apt install libasound2-dev       # internal/alsa
sudo apt install libpulse-dev         # internal/pulseaudio
sudo apt install i3-wm libjsoncpp-dev # internal/i3
sudo apt install libmpdclient-dev     # internal/mpd
sudo apt install libcurl4-openssl-dev # internal/github
sudo apt install libnl-genl-3-dev     # internal/network
```

### Compile

Download latest polybar release `polybar-<version>.tar.gz` from github: https://github.com/polybar/polybar/releases

``` bash
# Uncompress
tar xvzf polybar-<version>.tar
cd polybar-<version>

# Build
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/local/bin
sudo make install
```

### Configuration

``` bash
mkdir -p ~/.config/polybar/
cd       ~/.config/polybar/
ln -sf   ~/.dotfiles/linux/polybar/polybar.cfg config
ln -sf   ~/.dotfiles/linux/polybar/launch.bash launch.bash
```


## Resources

### Unicode Icons

- Look for icons here  : https://material.io/tools/icons/?icon=cached&style=baseline
- Get icon code here   : https://github.com/google/material-design-icons/blob/master/iconfont/codepoints
- or here              : https://fontawesome.com/cheatsheet
- Copy it from terminal: `echo -ne "\uf026" | xclip -selection clipboard`
- Paste into polybar INI module.
- Recommended Tool: yay -S fontmatrix
