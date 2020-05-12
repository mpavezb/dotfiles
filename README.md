# mpavezb dotfiles

## Overview

These dotfiles structure is based on the main systems I use on a daily basis:
- [Bash](bash/README.md)
- [Emacs](emacs/README.md)
- [Git](git/README.md)
- [Linux](linux/README.md)

## Guidelines

### File System

**Clean $HOME directory**: Do not clutter it! The following spaces shall be used:
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

**Symbolic Links**: Use them whenever possible.

### Scripting and Applications

**README.md**
- Applications must provide a `README.md` file.

**Prefer Python scripts**:
- Prefer using a virtual environment.
- Provide unit testing.
- Provide requirements.txt file.
- Format files with [black](https://github.com/psf/black).

**Bash Scripts**
- Should not modify the current working directory.
- Run [shellcheck](https://github.com/koalaman/shellcheck) on bash scripts.

**A well-behaved Unix-style command-line tool looks like this:**
- it does nothing if no sources are passed to it;
- it will read from standard input and write to standard output if `-` is used as the filename;
- it only outputs messages to users on standard error;
- exits with code 0 unless an internal error occurred.

**setup.bash**: Applications should provide a setup.bash script to install dependencies and set up the shell if needed.


### Git Repository

- Commit messages start with the application name. e.g., `[emacs]`

