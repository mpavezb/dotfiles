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

# Todo:
- size
- Icons
- colors and Color File, foregrounds
- warnings
- menus


## Unicode Icons

- Look for icons here  : https://material.io/tools/icons/?icon=cached&style=baseline
- Get icon code here   : https://github.com/google/material-design-icons/blob/master/iconfont/codepoints
- or here              : https://fontawesome.com/cheatsheet
- Copy it from terminal: `echo -ne "\uf026" | xclip -selection clipboard`
- Paste into polybar INI module.


## Dependencies

```bash
pacman -S light
pacman -S libmpdclient
yay -S polybar-git


    cairo
    libxcb
    python2
    xcb-proto
    xcb-util-image
    xcb-util-wm
    xcb-util-cursor required for the cursor-click and cursor-scroll settings
    xcb-util-xrm required for accessing X resources with ${xrdb:...}
    xcb-xkb required by internal/xkeyboard
    alsa-lib required by internal/alsa
    libpulse required by internal/pulseaudio
    i3-wm required by internal/i3
    jsoncpp required by internal/i3
    libmpdclient required by internal/mpd
    libcurl required by internal/github
    libnl-genl or wireless_tools required by internal/network

```


## TODO

### Important
- fix mpd
- wired network: Invalid network interface. Enable Autoconnect!
- fix power menu
- battery alt - remaining time
- wifi alt - IP
- wired alt - IP
- calendar
- audio
	- output interface
	- output volume
- Removable Drive Menu


### Ideas 
- important apps
	- spotify
	- firefox
	- skype
	- MEGA
	- Dropbox

