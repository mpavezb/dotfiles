# Emacs

## Content

Documentation:
- [C++ IDE](doc/cpp_ide.md)
- [Cheatsheet](doc/cheatsheet.md)
- [Profiling](doc/profiling.md)
- [Tips](doc/tips.md)

## Preparations

### Emacs27 installation 

Emacs 27 is required, but this is not available in Ubuntu 18.04, so it must be downloaded and installed manually.
- Download emacs 27.0.91 tar.gz package from the [github mirror](https://github.com/emacs-mirror/emacs/releases).
- Uncompress the package into the destination folder (`~/.opt/`).
- Read installation instructions on the `INSTALL` file located on the package root.

During configuration, make sure emacs is built with json support.
```bash
# Install build tools and all dependencies of a previous emacs version:
sudo apt-get install build-essential
sudo apt-get build-dep emacs
sudo apt-get install libacl1-dev libncurses5-dev libxpm-dev libgnutls28-dev texinfo gsfonts-x11 libjansson-dev

# Configure
./autogen
./configure --prefix=$HOME/.local

# Compile and Test
make -j<NCORES>
src/emacs -Q

# Install and Clean
make install
make clean
make distclean
```

Finally, create the application icon:
```bash
cp ~/.dotfiles/emacs/emacs.desktop ~/.local/share/applications/
```

### Setting up emacs configurations

Dependencies:
```bash
# C/C++
sudo apt install clang-9 clang-format-9 clangd-9
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-9 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-9 100

# Python
pip3 install 'python-language-server[all]'
pip3 install --user black
```

Set up emacs dotfiles:
```bash
bash ~/.dotfiles/emacs/setup.bash
```

Launch emacs and install missing packages on the go.


## Emacs .dotfiles Reference

- https://github.com/ianpan870102/.personal-emacs.d
- https://github.com/ianpan870102/yay-evil-emacs
- Helm Maintainer: https://github.com/thierryvolpiatto/emacs-tv-config
