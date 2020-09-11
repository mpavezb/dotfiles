## Overview

- How to mark a command as not important, as there is a better way to do it (like prefering C-x g instead of C-c p v)

## NOT EMACS

```bash
# GDB
C-x a  : toggle TUI
C-l /g : refresh screen
C-x 1  : one window
C-x 2  : mult window, cycle modes
C-p/n  :move in history
tui reg <TAB>: filter regs
```

## Custom Key Bindings
```bash
# goodies
M-x zone, zone-when-idle, zone-leave-me-alone
M-x fortune
M-x tetris, snake, pong, life, dunnet, blackbox

# Perspective (@C-x x)
@ s   : persp-switch: Query a perspective to switch to, or create.
@ k   : persp-remove-buffer: Query a buffer to remove from current perspective.
@ c   : persp-kill : Query a perspective to kill.
@ r   : persp-rename: Rename current perspective.
@ a   : persp-add-buffer: Query an open buffer to add to current perspective.
@ A   : persp-set-buffer: Add buffer to current perspective and remove it from all others.
@ b   : persp-switch-to-buffer: Like switch-to-buffer; includes all buffers from all perspectives; changes perspective if necessary.
@ i   : persp-import: Import a given perspective from another frame.
@ C-s : persp-state-save: Save all perspectives in all frames to a file
@ C-l : persp-state-load: Load all perspectives from a file
@ n, <right> : persp-next: Switch to next perspective
@ p, <left>  : persp-prev: Switch to previous perspective

# RG (@C-c s) [transient]
# search
@ r: regex
@ t: literal
@ p: project
@ c: cur dir
@ f: cur file
# refine
r: regex
t: literal
d: directory
f: file
# navigation
n/p : move and display
M-n/p : next
C-n/p : next file
RET   : go to
# toggles
g: recompile
c: case
i: ignored
A/B/C: context
W: words
S/R: sort
L: symlinks
# misc
e: edit mode (wgrep)
s/S: save
l: list
m: menu
C-c </> : next search
m b/f : next search

# ibuffer
## operations
m   : mark
u   : unmark
t   : toggle all (un)marks
%f  : mark by filename
%m  : mark by mode
%n  : mark by name
D   : kill marked
g   : refresh list
sa  : sort by lex
sf  : sort by filename
sv  : sort by last view
ss  : sort by size
sm  : sort by mode
si  : reverse sort
,   : rotate sort mode
## filters
//  : Remove filter
/p  : Remove top filter
/.  : OR on top two filters
/!  : Negate top filter
/m  : filter by mode
/n  : filter by buffername
/f  : filter by filename
/c  : filter by context
/>  : filter by size
/<  : filter by size
/s  : save filter w/name
/r  : switch to saved filter
/a  : add saved filter to current
/g  : create group
/P  : remove top group
/\  : remove groups
/S  : save groups w/name
/R  : restore saved group
/X  : Delete saved group
TAB : move to next group
M-p : move to previous group

# Compilation
M-p/n: move
C-c C-q: toggle visit

# kill-ring
M-y   : browse-kill-ring
C-M-y : popup-kill-ring

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
C-x M-g : magit-dispatch      (magit without going to status screen!)
C-c M-g : magit-file-dispatch (magit on file!)
C-c g g : git-timemachine
C-c g b : browse-at-remote
C-x v g : vc-annotate

# ORG
See: https://orgmode.org/manual/index.html
C-c a   : org-agenda
C-c l   : org-store-link
C-c .   : insert timestamp
C-c C-, : insert template (codeblocks, ...)

# GUI
C-x t : mp/toggle-theme
C-+   : text-scale-increase
C--   : text-scale-decrease

# C/C++
M-RET  : srefactor-refactor-at-point
M-RET  : srefactor-refactor-at-point

# Google
C-c /  : Google this keybindings
C-c t  : Google translate
```

## Important Commands

```bash
# General
C-c p h : fuzzy find projectile-helm
M-AvPag/Repag : Scroll Other
# https://stackoverflow.com/questions/812524/ido-mode-is-too-smart-can-i-get-it-to-not-complete-a-filename
C-j  : Make IDO not replace autocompletion NOW.

# company-mode
C-o: Hide not matching current regex.
M-x describe-function RET company-mode

# mp/
mp/put-buffername-on-clipboard
mp/s-split-words 
mp/s-lower-camel-case 
mp/s-upper-camel-case 
mp/s-snake-case 
mp/s-dashed-words 
mp/s-capitalized-words 
mp/s-titleized-words 
mp/s-word-initials 
mp/s-upcase 
mp/s-downcase 

# Dired (C-x d)
find-name-dired
find-grep-dired
dired-git-info-mode
f : visit
v : view
o : visit in other
+ : create subdirectory
= : compare files at point and mark
m : mark
u : unmark
t : toggle mark
g : reload
C-x C-q : edit from dired buffer
C : copy
R : rename
D : delete
S : symlink
Q : regex query replace
A : search regex
/ h : hide dotfiles
/ d : only directories
/ f : only files
/ <wait> : see all filters
!/: shell commands on files ????
*[./] : mark by ext ot directiories ????

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
C-c p  D   : open root on dired
C-c p  v   : open vc-dir on root

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

```bash
# Search
C-s/r   : search forward/reverse
C-M-s/r : search forward/reverse regex
M-p/n   : move up/down in search history

# Replace
M-%: interactive replace

M-p/n   : move up/down in history

# Shell Commands
F1      : ? Seems broken
C-F1    : ?
shell   : Run shell
M-!     : Run command
M-&     : Run command async
M-|     : Run command on region
C-u M-! : Run command, but paste output in buffer.


# Multiple Windows
[5]: Effect on frames
[4]: Effect on
[ ]: Effect on buffer
C-x  [5]  0  : delete this
C-x  [5]  1  : delete others
C-x  [5]  2  : split ----
C-x       3  : split  |
C-x  [5]  o  : switch cursor to other
C-x [4/5] b  : select buffer [in other]
C-x [4/5] C-o: display buffer [in other]
C-x [4/5] f  : find file [in other]
C-x [4/5] r  : find file [in other] (read-only)
C-x [4/5] d  : run dired [in other]

# Rectangles
C-x r r : Copy to register
C-x r k : kill
C-x r y : yank
C-x r o : open shifting right
C-x r c : blank out
C-x r t : string-rectangle  (works on rectangular selection)


# Registers
C-x r s: save region to register
C-x r i: insert register into buffer
C-x r SPC: save value of point in register
C-x r j: jump to saved point in register

# Macros
F3 : Start Macro
F4 : Save/Use Macro
C-x ( : Start Macro
C-x ) : End Macro
C-x e : Execute last macro
C-u C-x : Append to last macro
M-x name-last-kbd-macro
M-x insert-kbd-macro

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
