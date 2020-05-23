# C++ IDE

- [Overview](#overview)
- [Requirements](#requirements)
- [Tool Suite](#tool-suite)

## Overview

TODO

## Requirements

**Language Agnostic Requirements**:
- Git.
- Find file in project.
- Regex content in project.
- Multiple Cursors.

**Language Specific Requirements**:
- Syntax Highlighting.
- Autoformat.
- Jump to definition.
- Autocompletion.
- Syntax checking.

**Optional Requirements**:
- Compilation.
- Jump to error.
- Debugger.
- Refactoring.
- Class/File outline.

**Performance Requirements**:
- Must work properly in **huge** codebase.


## Tool Suite

- Syntax Highlighting:
- Autoformat: clang-format
- Autocompletion: company
- Syntax checking: flycheck
- Jump to definition:

- Compilation database: Bear
- Project: 

### Tools Study

Language Agnostic:
- [magit](https://magit.vc/): A Git Porcelain inside Emacs.
- [fzf](https://github.com/bling/fzf.el): An Emacs front-end for [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder.
- [rg](https://github.com/dajva/rg.el): Use [ripgrep](https://github.com/BurntSushi/ripgrep) in Emacs.
- [multiple-cursors](https://github.com/magnars/multiple-cursors.el): Multiple cursors similar to what sublime text provides.

C++ Specific:


LSP Servers:
- [lsp-mode](https://github.com/emacs-lsp/lsp-mode): LSP server for emacs.
- [ccls](https://github.com/MaskRay/ccls): C/C++/ObjC language server.
- [clangd](https://github.com/clangd/clangd): Clang based language server.

LSP Clients:
- [eglot](https://github.com/joaotavora/eglot): LSP client that stays out of your way.
- [emacs-ccls](https://github.com/MaskRay/emacs-ccls): Client for ccls, a C/C++ language server
- [emacs-cquery](https://github.com/cquery-project/emacs-cquery): Client for cquery.

Full Stack:
- [RTags](https://github.com/Andersbakken/rtags): A client/server indexer for c/c++/objc[++] with integration for Emacs based on clang. http://www.rtags.net

Tooling:
- [Bear](https://github.com/rizsotto/Bear): Generate a compilation database for clang tooling.


## References

- https://develop.spacemacs.org/layers/+lang/c-c++/README.html
- https://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html#company
- https://tuhdo.github.io/c-ide.html
- http://syamajala.github.io/c-ide.html

