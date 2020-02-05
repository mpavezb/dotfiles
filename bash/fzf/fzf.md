# fzf: Command-Line fuzzy finder

- Repository: https://github.com/junegunn/fzf

## Installation

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.opt/fzf
~/.opt/fzf/install
```

## Usage

- CTRL-T : Search for files and directories.
- CTRL-R : Search in history.
- ALT-C  : CD to a directory.
- **<TAB> : Trigger fzf for files and directories.

Fzf also provides support for:
- kill <TAB>
- ssh **<TAB>
- export **<TAB>


## mp::git

- CTRL-G CTRL-F : Files listed in git status
- CTRL-G CTRL-B : Branches
- CTRL-G CTRL-T : Tags
- CTRL-G CTRL-H : Commit hashes
- CTRL-G CTRL-R : Remotes
