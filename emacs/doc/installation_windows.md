# Installation

## Install Emacs

- Download installer from the official page: https://www.gnu.org/software/emacs/download.html
- Current Version: 27.1

## Emacs Settings

Considerations:
- The emacs settings folder `.emacs.d` should be located on `%HOMEPATH%`.
- Emacs expands `~` properly according to the system.

```bat
:: Get the repo
cd %HOMEPATH%
git clone https://github.com/mpavezb/dotfiles .dotfiles

:: Link emacs settings
:: Note: The script requires superuser privileges to create symlinks!
> setup.bat
```

All The Icons:
- Download repo somewhere: https://github.com/domtronn/all-the-icons.el
- Install each font by opening them and clicking the Install button.
- Execute `all-the-icons-install-fonts` and select the installation directory.

FZF, RG:
- Download the binaries for Windows:
	- https://github.com/BurntSushi/ripgrep/releases
	- https://github.com/junegunn/fzf/releases
- Put them somewhere in the Path (e.g., `%HOMEPATH%\.opt\bin`).
- WIP, both are still broken.

Helm:
- If helm fails to clone (or any other repo) due to timeout, then try increasing the http buffer sizes:
	- `git config --global http.postBuffer 500M`
	- `git config --global http.maxRequestBuffer 100M`
	- `git config --global core.compression 0`
- Or the https ones:
	- `git config --global https.postBuffer 500M`
	- `git config --global https.maxRequestBuffer 100M`
	- `git config --global core.compression 0`

TODO:
- Themes requires Helm before it is installed
- Native Compilation
- C++ IDE
- Markdown Mode requires /usr/bin/pandoc