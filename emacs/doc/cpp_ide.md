# C++ IDE

- [Overview](#overview)
- [Requirements](#requirements)
- [Tool Suite](#tool-suite)

## Requirements

**Language Agnostic Requirements**:
- Git.
- Find file in project.
- Regex content in project.
- Project Management.

**Language Specific Requirements**:
- Autocompletion.
- Autoformating.
- Jump to definition.
- Syntax Highlighting.
- Syntax Checking.

**Optional Requirements**:
- Class/File outline.
- Compilation.
- Debugger.
- Jump to error.
- Refactoring.

**Performance Requirements**:
- Must work properly in **huge** codebase.


## Tool Suite

Git:
- [magit](https://magit.vc/): A Git Porcelain inside Emacs.
- [browse-at-remote](https://github.com/rmuslimov/browse-at-remote): Browse target page on github/bitbucket from emacs buffers.

Project Management:
- [projectile](https://github.com/bbatsov/projectile): Project Interaction Library for Emacs.

Navigation:
- [helm](https://github.com/emacs-helm/helm): Emacs incremental completion and selection narrowing framework.
- [rg](https://github.com/dajva/rg.el): Use [ripgrep](https://github.com/BurntSushi/ripgrep) in Emacs.
- [fzf](https://github.com/bling/fzf.el): An Emacs front-end for [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder.

Autoformating:
- [clang-format](https://melpa.org/#/clang-format): Format code using clang-format.
- [clang-format+](https://github.com/SavchenkoValeriy/emacs-clang-format-plus): Emacs minor mode for automatic clang-format. application.

Syntax Checking:
- [flycheck](https://github.com/flycheck/flycheck): On the fly syntax checking for GNU Emacs.

Autocompletion:
- [company-mode](https://github.com/company-mode/company-mode): Modular in-buffer completion framework (frontend) for Emacs.

Syntax Highlighting: 
- [modern-c++-font-lock](https://github.com/ludwigpacifici/modern-cpp-font-lock): Syntax highlighting support for "Modern C++".
- 

Jump to Definition: 
- TODO

LSP Servers:
- [cquery](https://github.com/cquery-project/cquery): (DEPRECATED) Clang based.
- [ccls](https://github.com/MaskRay/ccls): Fork of cquery.
- [clangd](https://github.com/clangd/clangd): Clang based. Part of LLVM.

LSP Clients:
- [emacs-cquery](https://github.com/cquery-project/emacs-cquery): Emacs cquery frontend.
- [emacs-ccls](https://github.com/MaskRay/emacs-ccls): Emacs ccls fontend. Built on top of lsp-mode.
- [eglot](https://github.com/joaotavora/eglot): LSP client that stays out of your way.
- [lsp-mode](https://github.com/emacs-lsp/lsp-mode).

Full Stack/Non LSP:
- [RTags](https://github.com/Andersbakken/rtags): A client/server indexer for c/c++/objc[++] based on clang.
- [irony-mode](https://github.com/Sarcasm/irony-mode): A C/C++ minor mode powered by libclang.
  - company-irony
  - flycheck-irony
  - irony-eldoc

Tooling:
- [Bear](https://github.com/rizsotto/Bear): Generate a compilation database for clang tooling.


## References

Autoformatting:
- https://eklitzke.org/smarter-emacs-clang-format

RTags / Irony based IDEs:
- https://github.com/atilaneves/cmake-ide
- https://tuhdo.github.io/c-ide.html
- http://syamajala.github.io/c-ide.html
- https://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html

Multi-Backend IDEs:
- https://develop.spacemacs.org/layers/+lang/c-c++/README.html
