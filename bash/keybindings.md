# Bash Keyboard Shortcuts

All commands below assume bash is configured in emacs mode:
```bash
set -o emacs
```

Reference:
- https://ss64.com/bash/syntax-keyboard.html
- http://web.mit.edu/gnu/doc/html/features_7.html


## Moving the cursor:
- C-a  :  Go to the beginning of the line (<Home>)
- C-e  :  Go to the End of the line (<End>)
- C-p  :  Previous command (<up>)
- C-n  :  Next command (<down>)
- C-b  :  Backward one character (<left>)
- C-f  :  Forward one character (<right>)
- M-b  :  Back (left) one word (C-<left>)
- M-f  :  Forward (right) one word (C-<right>)
- C-x C-x :  Toggle between the start of line and current cursor position

## Editing:

Terminology:
- Word: Set of characters. Limited by special characters (e.g., ` /.,`).
- Term: Compound of words. Limited by spaces.
- Delete: String is deleted.
- Kill: String is deleted and added to clipboard.
- Yank: Paste.

Unless specified otherwise, actions start at the cursor position.

- C-x C-e       : Edit in `$VISUAL`.
- C-/           : Undo.
- C-y           : Yank.
- M-y           : Rotate the kill-ring (after yank).
- <TAB>         : Complete.
- C-d           : Delete character under cursor.
- C-h           : Delete character before cursor (<backspace>).
- M-<backspace> : Kill word before.
- M-d           : Kill word after.
- C-w           : Kill term before.
- C-u           : Kill line before.
- C-k           : Kill line after.
- M-t           : Swap word with previous.
- C-t           : Swap last two characters before the cursor.
- <Esc> + t     : Swap two previous words.
- M-u           : Upcase word after.
- M-l           : Downcase word after.
- M-c           : Capitalize character and move to end of word.
- M-r           : Cancel the changes and put back the line as it was in the history (revert).

## Process Control

- C-l : Clear the screen
- C-d : Close shell.
- C-s : Disable output to the screen.
- C-q : Enable  output to the screen.
- C-c : Send `SIGINT` signal, to interrupt (abort) process.
- C-z : Send `SIGTSTP` signal, to stop (suspend) process. Use `fg <name>` to recover.
