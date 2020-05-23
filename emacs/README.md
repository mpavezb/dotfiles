# Emacs

## Content

Documentation:
- [C++ IDE](doc/cpp_ide.md)
- [Cheatsheet](doc/cheatsheet.md)
- [Profiling](doc/profiling.md)
- [Tips](doc/tips.md)

## Preparations

### Emacs26 installation 

Emacs 26 is required, but this is not available in Ubuntu 18.04, so it must be downloaded and installed manually.
- Download emacs 26.3 release tar.gz package from the [github mirror](https://github.com/emacs-mirror/emacs/releases).
- Uncompress the package into the destination folder (`~/.opt/`).
- Read installation instructions on the `INSTALL` file located on the package root.

```bash
# Install build tools and all dependencies of a previous emacs version:
sudo apt-get install build-essential
sudo apt-get build-dep emacs
sudo apt-get install libacl1-dev libncurses5-dev libxpm-dev libgnutls28-dev textinfo gsfonts-x11

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
cp emacs.desktop ~/.local/share/applications/
```

### Setting up emacs configurations

Dependencies:
```bash
sudo apt install clang-format
pip install --user black
```

Set up emacs dotfiles:
```bash
bash setup.bash
```

Launch emacs and install missing packages on the go.


## Emacs .dotfiles Reference

- https://github.com/ianpan870102/.personal-emacs.d
- https://github.com/ianpan870102/yay-evil-emacs
