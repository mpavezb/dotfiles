# Installation Guide

## Install emacs from source

This allows using the native-compilation feature that brings great speed ups.

Read the [installation](doc/emacs_source_build.md) instructions.


## Bootloader

The bootloader (Chemacs 2) allows choosing between different emacs flavours.

From Chemacs2 README:
> Chemacs 2 is an Emacs profile switcher, it makes it easy to run multiple Emacs configurations side by side.
>
> Think of it as a bootloader for Emacs.


### Installing the bootloader

Chemacs2 replaces the `~/.emacs.d` folder.

```bash
# Bootloader
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d


# Define profiles
cp ~/.dotfiles/emacs/boot/emacs-profiles.el         ~/.emacs-profiles.el

# Create launchers
cp ~/.dotfiles/emacs/boot/emacs-sandbox.desktop     ~/.local/share/applications/
cp ~/.dotfiles/emacs/boot/emacs-spacemacs.desktop   ~/.local/share/applications/
cp ~/.dotfiles/emacs/boot/emacs.desktop             ~/.local/share/applications/
cp ~/.dotfiles/emacs/boot/emacs-doom.desktop        ~/.local/share/applications/
```

### Using bootloader profiles

Each profile can be launched by using the unity launcher or by manually running any of the following:

```bash
emacs
emacs --with-profile sandbox
emacs --with-profile doom
emacs --with-profile spacemacs
```

## Doom Installation

```bash
# Get files
mkdir -p ~/.emacs_ws/doom/
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs_ws/doom/distro
ln -sf ~/.dotfiles/emacs/doom/ ~/.emacs_ws/doom/config

# Install doom
export DOOMDIR=~/.emacs_ws/doom/config
~/.emacs_ws/doom/distro/bin/doom install
```

## Spacemacs Installation

```bash
mkdir -p ~/.emacs_ws/spacemacs/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs_ws/spacemacs/distro
```

## Kernel Distro [Deprecated]

### Dependencies

```bash
# Bash
sudo apt install npm
npm i -g bash-language-server

# CMake
pip3 install cmake-language-server

# C/C++
sudo apt install bear
sudo apt install libstdc++-10-dev libstdc++-10-doc
sudo apt install clang-10 clangd-10 clang-format-10
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100

# Python
pip3 install --user black
pip3 install 'python-language-server[all]'
pip3 install pyls-black pyls-mypy pyls-isort

# Markdown
# TODO: `which pandoc` should be used instead of raw /usr/bin/pandoc.
sudo apt-get install pandoc

## XML
#cd ~/.opt/
#git clone https://github.com/eclipse/lemminx
#cd lemminx
#./mvnw clean verify

# YAML
npm i -g yaml-language-server
```

### Install Distro

The `user-emacs-directory` for the distro is `~/.emacs_ws/kernel`.

The following commands symlink the distro folder to this repository.


```bash
mkdir -p ~/.emacs_ws/kernel/
cd       ~/.emacs_ws/kernel/

ln -sf ~/.dotfiles/emacs/distro/
ln -sf distro/init.el
```

Then, launch emacs and install missing packages on the go.

Finally, manually call setup tools within emacs:
```
M-x dap-cpptools-setup
```
