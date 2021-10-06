# GccEmacs (emacs28 with native-compilation)

Emacs 28 is not yet released, but is somehow stable. It includes the native compilation feature that provides big speed ups. See the [developers talk](https://www.youtube.com/watch?v=zKHYZOAc_bQ) and the [development page](https://akrl.sdf.org/gccemacs.html) for extra information.


```bash
# Download
git clone https://github.com/emacs-mirror/emacs
cd emacs
git checkout master

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
# Make sure that ./configure displays: Does Emacs have native lisp compiler? yes
./autogen.sh
./configure --prefix=$HOME/.local --with-native-compilation


# Compile and Test
make -j$(($(nproc) - 2))
src/emacs -Q

# Install and Clean
make install
make clean
make distclean
```

## Use these expressions to test for required features

```lisp
;; Native Compilation Support
(if (and (fboundp 'native-comp-available-p)
       (native-comp-available-p))
  (message "Native compilation is available")
  (message "Native complation is *not* available"))

;; Native JSON support
(if (functionp 'json-serialize)
  (message "Native JSON is available")
(message "Native JSON is *not* available"))
```
