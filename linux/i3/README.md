# i3

## Resources

- i3: https://i3wm.org/docs/
- Playerctl : https://github.com/altdesktop/playerctl
- rofi: https://github.com/davatorium/rofi
- Images:
  - https://unsplash.com/
  - http://simpledesktops.com/

## Install

```bash
sudo apt install i3
sudo apt install i3lock
sudo apt install playerctl  # media player control
sudo apt install feh        # background
sudo apt install arandr     # display configuration
sudo apt install rofi       # dmenu replacement
sudo apt install compton    # allow transparent windows
sudo apt install i3blocks   # status bar
```

## Configuration

```bash
# i3 config
mkdir -p ~/.config/i3/
cd       ~/.config/i3/
ln -sf ~/.dotfiles/linux/i3/i3.cfg config

# rofi config
mkdir -p ~/.config/rofi/
cd       ~/.config/rofi/
ln -sf ~/.dotfiles/linux/rofi/rofi.cfg config.rasi
```

### Displays

Use `arandr` (GUI tool for `xrandr`) to generate a valid `xrandr` configuration.
Save the configuration to a file and copy the generated command into the i3 config file as: `exec_always xrandr ...`.

### Bind application to workspace

1. Open desired application.
2. Open terminal and run `xprop`.
3. Click desired application.
4. Copy the value of the `WM_CLASS` key.
5. Put in config: `assign [class="..."] $ws1`

### Fonts

- https://github.com/FortAwesome/Font-Awesome


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
- Better lock screen: www.reddit.com%2Fr%2Funixporn%2Fcomments%2F3358vu%2Fi3lock_unixpornworthy_lock_screen
- sound device chooser
- sound configuration:
	- https://askubuntu.com/questions/14077/how-can-i-change-the-default-audio-device-from-command-line
- network manager
- calendar
- Other Media keys: https://faq.i3wm.org/question/3747/enabling-multimedia-keys/?answer=3759#post-id-3759
- wallpaper cycle

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

