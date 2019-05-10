# Emacs TODOs


## TODO
- Open last closed file
- move line/selection up down
- vertical cursors


## Less important

- TMux: multiple shells inside emacs
- C++ IDE
- org-mode.org
- dotfiles
- TRAMP
- CALC


## C++ IDE setup

### Dependencies
```bash
sudo apt install cmake libclang-dev
```

### Emacs packages
```emacs
M-x package-install RET company
M-x package-install RET flycheck

; irony
M-x package-install RET irony
M-x package-install RET company-irony
M-x package-install RET company-irony-c-headers
M-x package-install RET flycheck-irony
M-x package-install RET irony-eldoc

; rtags
M-x package-install RET rtags
M-x package-install RET helm
M-x package-install RET helm-rtags
M-x package-install RET company-rtags
M-x package-install RET flycheck-rtags
```

A compilation database needs to be generated using: 
```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
```

```bash
mkdir -p ~/.opt && cd ~/.opt/
git clone --recursive https://github.com/Andersbakken/rtags.git
mkdir -p build && cd build
cmake ..
make
sudo make install

M-x package-install-file RET ~/.emacs.d/lisp/levenshtein.el RET
M-x package-install RET rtags RET

```
