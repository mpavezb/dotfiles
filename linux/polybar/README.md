# Polybar

Polybar: https://github.com/jaagr/polybar

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
