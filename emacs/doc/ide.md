# Emacs as an IDE

- [Tool Suite](#tool-suite)

## Tool Suite

**Language Agnostic Requirements**:
- Navigation: [helm](https://github.com/emacs-helm/helm).
- Git: [magit](https://magit.vc/), [browse-at-remote](https://github.com/rmuslimov/browse-at-remote).
- Find file in project: [fzf](https://github.com/bling/fzf.el).
- Regex content in project: [rg](https://github.com/dajva/rg.el).
- Project Management: [projectile](https://github.com/bbatsov/projectile).

**Language Specific Requirements**:
- LSP Client: [lsp-mode](https://github.com/emacs-lsp/lsp-mode)
  - Find definitions.
  - Find references.
  - Find errors.
  - Symbol Highlight.
  - Refactoring.
  - Code lens.
- LSP Server: [clangd](https://github.com/clangd/clangd), [Bear](https://github.com/rizsotto/Bear).
- Autocompletion: [company-mode](https://github.com/company-mode/company-mode).
- Autoformating: [clang-format+](https://github.com/SavchenkoValeriy/emacs-clang-format-plus).
- Syntax Highlighting: [modern-c++-font-lock](https://github.com/ludwigpacifici/modern-cpp-font-lock).
- Syntax Checking: [flycheck](https://github.com/flycheck/flycheck).

**Optional Requirements**:
- Class/File outline.
- Compilation.
- Debugger: [dap-mode](https://emacs-lsp.github.io/dap-mode/). [lldb-vscode](https://github.com/llvm/llvm-project/tree/master/lldb/tools/lldb-vscode).
- Disassembly: [disaster (TODO)](https://github.com/jart/disaster).
- Git Lens: https://code.visualstudio.com/blogs/2017/02/12/code-lens-roundup#_git-lens
- Regex Lens: https://code.visualstudio.com/blogs/2017/02/12/code-lens-roundup#_regex-previewer

**Performance Requirements**:
- Must work properly in **huge** codebase.


## Relevant Commands

```bash
# Find def/ref
lsp-find-definition
lsp-find-references
helm-lsp-workspace-symbol
helm-lsp-global-workspaces-symbol

# refactoring
lsp-rename
lsp-execute-code-action

# treemacs
lsp-treemacs-errors-list : global error list
lsp-treemacs-symbols
lsp-treemacs-references
lsp-treemacs-implementations
lsp-treemacs-type-hierarchy
lsp-treemacs-call-hierarchy
C-u M-x lsp-treemacs-call-hierarchy : display outgoing call hierarchy.

# Formatting
lsp-format-buffer

```

## Languages

### C/C++

#### Compilation Database

Clang requires a JSON compilation database file `compile_commands.json` in the project root.
- CMake: `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`
- Bazel:
- Other: `bear make` (see [bear](https://github.com/rizsotto/Bear)).

Bear intercepts compilation commands issued by the build process. In order to avoid having to recompile everything whenever a build is cached, bear can append results of later executions: `bear -a make`.

Bazel (TODO):
- https://github.com/vincent-picaud/Bazel_and_CompileCommands

#### Debugging

```bash
# Flags to compile emacs with debug symbols
CFLAGS="-ggdb3 -O0" CXXFLAGS="-ggdb3 -O0" LDFLAGS="-ggdb3" ./configure
```

See the [c++ dap tutorial](https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/#debugging) on how to create debug configurations.


TODO: Alternative debugger: https://github.com/realgud/realgud

## TODO

- Bash: https://emacs-lsp.github.io/lsp-mode/page/lsp-bash/
- XML: https://emacs-lsp.github.io/lsp-mode/page/lsp-xml/
- Yaml: https://emacs-lsp.github.io/lsp-mode/page/lsp-yaml/
- Cmake: https://emacs-lsp.github.io/lsp-mode/page/lsp-cmake/
- Dapconfig: https://emacs-lsp.github.io/dap-mode/
- Python:
  - https://www.reddit.com/r/emacs/comments/ih3q5x/lsp_for_python_sure_but_which_lsp_server/?utm_medium=android_app&utm_source=share
