# Installation Guide

## Install emacs from source

This allows using the native-compilation feature that brings great speed ups.

Read the [installation](doc/emacs_source_build.md) instructions.


## Bootloader

The bootloader allows choosing between different emacs flavours.

Read the [bootloader](boot/BOOT.md) instructions.


## Kernel Distro

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
