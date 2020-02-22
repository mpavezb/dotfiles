# mpavezb dotfiles

## Overview

- [Bash](bash/README.md)
- [Emacs](emacs/README.md)
- [Git](git/README.md)
- [Linux](linux/README.md)
- [rxvt-unicode](urxvt/README.md)

## Guidelines

### Applications

- Applications are self-contained into the assigned folder.
- Commit messages start with the application name. e.g., `[emacs]`

### Scripts

- Must pass `shellcheck` test.
- Must verify check before sourcing stuff.

### File System

- Use symbolic links whenever possible.
- Do not clutter HOME directory. Keep configurations under `~/.config/`.
