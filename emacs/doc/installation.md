# Installation

## GccEmacs (emacs28 with native-compilation)

Emacs 28 is not yet released and the `feature/native-comp` branch is still in development, but somehow stable. See the [developers talk](https://www.youtube.com/watch?v=zKHYZOAc_bQ), and the [development page](https://akrl.sdf.org/gccemacs.html).

The native compilation feature promises big speed ups.

```bash
# Download
git clone https://github.com/emacs-mirror/emacs
cd emacs
git checkout feature/native-comp

# Usual deps
sudo apt install build-essential
sudo apt build-dep emacs # This requires enabling "source code" on Software & Updates.  
sudo apt install libacl1-dev libncurses5-dev libxpm-dev libgnutls28-dev texinfo gsfonts-x11 git

# gcc-10
sudo add-apt-repository ppa:ubuntu-toolchain-r/test && sudo apt-get update # < 20.04
sudo apt-get install gcc-10 libgccjit0 libgccjit-10-dev

# libjansson-dev
sudo apt-get install libjansson4 libjansson-dev

export CC="gcc-10"

# Configure
./autogen.sh
./configure --prefix=$HOME/.local --with-nativecomp --with-mailutils

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
# File assumes the user is 'mpavezb', modify accordingly.
cp ~/.dotfiles/emacs/emacs.desktop ~/.local/share/applications/
```

## Setting up emacs configurations

Dependencies:
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

Set up emacs dotfiles:
```bash
bash ~/.dotfiles/emacs/setup.bash
```

Launch emacs and install missing packages on the go.

Finally, manually call setup tools within emacs:
```
M-x dap-cpptools-setup
```

## Troubleshooting

There might be an error during initialization related to Helm. This got fixed by removing some outdated void variables:
```bash
rg "minibuffer-local-must-match-filename-map" ~/.emacs.d/
rg "browse-url-mosaic-program" ~/.emacs.d/
```
