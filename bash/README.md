# BASH

## Dependencies

Dependencies are optional. They are loaded if found.

- bat: https://github.com/sharkdp/bat
- fzf: https://github.com/junegunn/fzf
- virtualenv

## Setup

Put the following in the `.bashrc` file.

```bash
source "$HOME/.dotfiles/bash/bashrc.bash"
```

This enables the following:
- Local paths
- Shell options: history, globs, autocompletion.
- EDITOR: emacsclient.
- Prompt
- Aliases
- FZF
- BAT

Run the following script to copy profile and logout rc files.
```bash
bash setup.bash
```

## Initialization Files

### Interactive Shell

An interactive shell reads commands from user input on a tty. Among other things, such a shell reads startup files on activation, displays a prompt, and enables job control by default. The user can interact with the shell.

A shell running a script is always a non-interactive shell. All the same, the script can still access its tty. It is even possible to emulate an interactive shell in a script.

Source: https://www.tldp.org/LDP/abs/html/intandnonint.html

### Login and Non-Login Shells

A login shell is the first process that executes under your user ID when you log in for an interactive session. The login process tells the shell to behave as a login shell.

- **interactive, login shell**: When you log in on a text console, or through SSH, or with su -.
- **interactive, non-login shell (subshell)**: When you start a shell in a terminal in an existing session (screen, X terminal, Emacs terminal buffer, a shell inside another, etc.).
- **non-interactive, non-login shell (script)**: When a shell runs a script or a command passed on its command line.
- When you log in in graphical mode (on an X display manager), you don't get a login shell, instead you get a session manager or a window manager.

Source: https://unix.stackexchange.com/a/46856/49064

### Configuration files

Depending on the shell type, they read the following files in order:

- **interactive, login shell**: `/etc/profile` -> [`~/.bash_profile` || `~/.bash_login` || `~/.profile`] (only the first of the ones found) -> `~/.bash_logout`.
- **interactive, non-login shell**: `/etc/bash.bashrc` -> `~/.bashrc`.
- **non-interactive, non-login shell**: `$BASH_ENV`.

Source: https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

Notes:
- `~/.bashrc` and `~/.bash_profle` files are `bash` specific.
- It is common to source `~/.bashrc` on `~/.*profile` files.
- `~/.profile` must be `/bin/sh`.


## Command line fuzzy finder

See the [README](fzf/README.md) file.

## Bash prompt

This prompt shows git information whenever available.

### Profiling

Some delay issues have been found when using in large repositories. The table below shows elapsed time used to generate the prompt for the [Rust repository](https://github.com/rust-lang/rust).

The time is measured using the `time` BASH command.

| Version | Time     | Description                                    |
| ------- | -------- | ---------------------------------------------- |
| 0.0     | 0m0,012s | No git prompt.                                 |
| 1.0     | 0m2,259s | First implementation (bash).                   |
| 1.1     | 0m0,800s | Add `--ignore-submodules` to git status calls. |
| 1.2     | 0m0,440s | Add `--ignore-submodules` to git diff calls.   |
