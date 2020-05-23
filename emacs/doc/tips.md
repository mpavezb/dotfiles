# Tips

## Running Emacs

Startup options:
- `--no-desktop`
- `--no-init-file`


## Multiple Desktops

- Emacs can handle multiple desktops -> each one is handled by own file.
- `M-x desktop-change-dir` : Load another file.
- `M-x desktop-clear` : Clear desktop file.
- `desktop-clear-preserve-buffers-regexp`: which buffers not ot clear.
- `desktop-restore-eager`: Max buffers to load eagerly on startup. Others are loaded eagerly.


