# i3

## Install

```bash
sudo apt-install i3
sudo apt-install i3lock
sudo apt-install playerctl
```

## Configuration

```bash
mkdir -p ~/.config/i3/
cd       ~/.config/i3/

ln -sf ~/.dotfiles/linux/i3/config
```

## TODO

Important:
- Assign icons to WS
- Assign apps to ws:
	- Layout:
		- 1: browser
		- 2: terminal
		- 3: edit
		- ...
		- 9: chat
		- 10: music
	- Open apps in dedicated ws by default.
- Interaction with multiple screens.
- Move workspace to screen.
- Background
- Gnome extensions like features: Check.
- i3lock
- sound device chooser
- sound configuration:
	- https://askubuntu.com/questions/14077/how-can-i-change-the-default-audio-device-from-command-line
- network manager
- calendar

Bugs:
- playerctl stop/play affects youtube instead of spotify

## Shortcuts

General:
- Mod + Enter           : Terminal
- Mod + D               : Execute
- Mod + Shift + C       : Reload Config.
- Mod + Shift + X       : Lock.
- Mod + Shift + R       : Restart I3.
- Mod + Shift + E       : Logout from I3.

Navigation:
- Mod + [jkl;]          : Change Focus
- Mod + [arrow]         : Change Focus
- Mod + #               : Open WS #
- Mod + Shift + [arrow] : Move app to Window
- Mod + Shift + #       : Move app to WS #
- Mod + A               : Focus parent.
- Mod + Space           : Toggle focus floating/tilt

Layout:
- Mod + S               : Stacked Windows
- Mod + W               : Tabbed Windows
- Mod + E               : Tilted Windows Hors/Vert
- Mod + V               : Next window is opened vertically.
- Mod + R               : Resize mode
- Mod + F               : Fullscreen toggle
- Mod + Shift + Space   : Toggle floating window

