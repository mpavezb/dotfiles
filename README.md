# mpavezb dotfiles

## Overview

These dotfiles structure is based on the main systems I use on a daily basis:
- [Bash](bash/README.md)
- [Emacs](emacs/README.md)
- [Git](git/README.md)
- [Linux](linux/README.md)

## File System Guidelines

The `$HOME` directory should be kept clean. Do not clutter it with files/folders. The following spaces shall be used:
- `~/downloads/`: For downloaded files.
- `~/documents/`: For documents.
- `~/workspaces/`: For current projects.
- `~/.cache/`: For cached data.
- `~/.emacs.d/`: Emacs user directory.
- `~/.config/`: For application configuration files.
- `~/.dotfiles`: This repository.
- `~/.local/`: For user installed applications using `bin,include,lib,share` spaces.
- `~/.opt/`: For downloaded/cloned applications.
- `~/.hidden`: Use it to hide directories which cannot be moved away!.

## Scripting and Application Guidelines

Each application / script should be documented:
- Provide `README.md` for applications.
- Document script intention and usage.

Each application should provide a `setup.bash` script to install dependencies and set up the shell if needed.

Prefer **Python scripts** over Bash scripts. And:
- Prefer using a virtual environment.
- Provide unit testing.
- Provide requirements.txt file.
- Format files with [black](https://github.com/psf/black).

Bash scripts considerations:
- No mater the exit state, the current working directory should not be modified.
- Run [shellcheck](https://github.com/koalaman/shellcheck) to check for common mistakes.

A **well-behaved Unix-style command-line tool** looks like this:
- it does nothing if no sources are passed to it;
- it will read from standard input and write to standard output if `-` is used as the filename;
- it only outputs messages to users on standard error;
- exits with code 0 unless an internal error occurred.

## Git Repository

- Commit messages should start with the application name. e.g., `[emacs]: Add Foo.`.

