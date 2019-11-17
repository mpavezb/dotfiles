# Emacs

## Custom Key Bindings
```
# Buffers
C-x M-k : mp/reopen-killed-file

# multiple-cursors
C-c C-<       : mc/mark-all-like-this
C->           : mc/mark-next-like-this
C-<           : mc/mark-previous-like-this
C-S-c C-S-c   : mc/edit-lines
C-S-<mouse-1> : mc/add-cursor-on-click

# Selection
M-+ : er/expand-region
M-- : er/contract-region

# Project
F8: mp/neotree-project-dir

# Git
C-x g   : magit-status
C-x C-g : git-timemachine
C-x v g : vc-annotate
C-c g g : browse-at-remote

# ORG
C-c a   : org-agenda
C-c l   : org-store-link

# GUI
C-x t : mp/toggle-theme
C-+   : text-scale-increase
C--   : text-scale-decrease

# C/C++
M-RET  : srefactor-refactor-at-point
M-RET  : srefactor-refactor-at-point

```

## Important Commands

```
# mp/
mp/put-buffername-on-clipboard

# Dired
find-name-dired

# Projectile
# https://projectile.readthedocs.io/en/latest/usage/
C-c p  f   : projectile-find-file
C-c p  F   : projectile-find-file-in-known-projects
C-c p  a   : switch to file with different extension
C-c p  s g : projectile-grep
C-c p  4 f : projectile-find-file-other-window
C-c p  5 f : projectile-find-file-other-frame
C-c p  4 a : switch to file with different extension in other window
C-c p  5 a : switch to file with different extension in other frame
C-c p  p   : projectile-switch-project

# Semantic
C-c , j : semantic-complete-jump-local (jump to function in buffer)
C-c , J : semantic-complete-jump (jump to function anywhere)
C-c , l : semantic-analyze-possible-completions
C-c , <SPC> : semantic-complete-analyze-inline (possible completions)

# Neotree
# https://github.com/jaypei/emacs-neotree
SPC, RET, TAB :  Open current item if it is a file. Fold/Unfold current item if it is a directory.
n       : next line, p previous line.
U       : Go up a directory.
g       : Refresh.
A       : Maximize/Minimize the NeoTree Window.
H       : Toggle display hidden files.
O       : Recursively open a directory.
C-c C-n : Create a file or create a directory if filename ends with a ‘/’.
C-c C-d : Delete a file or a directory.
C-c C-r : Rename a file or a directory.
C-c C-c : Change the root directory.
C-c C-p : Copy a file or a directory.

# editor
whitespace-mode
tabify
untabify
```

```
# Rectangles
C-x r t : string-rectangle  (works on rectangular selection)
C-s     : isearch-forward   (puts mark at the beginning of the match)

# Macros
F3 : Start Macro
F4 : Save/Use Macro

# Transpose
C-x C-t : transpose-lines
 - switch current and previous line, leaving point after both.
 - Repeat to move same line towards bottom.
 
C-t : transpose-chars
 - switch current and previous char, leaving point after both.

M-t : transpose-words
 - switch current (up to space) and previous word, leaving point after both.

# Misc
M-l : downcase-word
 - Convert word (from point to end) to lowercase, leaving point after. 

C-M-n forward-list
 - Jump forward to matching parenthesis.

C-@ er/expand-region

M-% query-replace
 - Replace string with another, one by one.
 - Press 'y' to replace current, and 'n' to skip current.

```


## Must Have Tools

- Jump to definition
- Autocompletion 
- Syntax Highlighting
- Find file in project
	- Project structure
	- Open File
- Compilation
- Grafical Debugger
- Text Pastry 1 to X

### C++ IDE
- Navigation (jump from reference to definition and vice versa).
- File outline (list of symbols in file for quick navigation).
- Code completion.
- Real-time syntax checking.

