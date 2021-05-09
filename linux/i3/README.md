# i3

Official Documentation: https://i3wm.org/docs/

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


## How To

### Bind applications to a workspace

1. Open desired application.
2. Open terminal and run `xprop`.
3. Click desired application.
4. Copy the value of the `WM_CLASS` key.
5. Put in config: `assign [class="..."] $ws1`

