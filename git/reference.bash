#!/bin/bash
# Git Recipes

# remove untracked
git clean

# ==========================================================
# GIT LFS
# ==========================================================

# un/install lfs hooks
git-lfs uninstall
git-lfs install

# Get required file from LFS
git-lfs pull --include '<big filename>'

# ==========================================================
# GIT STASH
# ==========================================================
git stash apply    # pops but dont remove from stack
git stash -u       # --include-untracked
git stash save "." # custom message

# rename stash
git stash drop stash@{0}
git stash store -m "..." <hash-printed-by-drop>

# ==========================================================
# GIT SUBMODULE
# ==========================================================

# Do on all submodues
git submodule foreach git ...

# commits which are in branch_a but not in branch_b
git submodule foreach git log branch_a --not branch_b --pretty=oneline --abbrev-commit

# ==========================================================
# GIT LOG
# ==========================================================
# commits which are in branch_a but not in branch_b
git log branch_a --not branch_b --pretty=oneline --abbrev-commit

# ==========================================================
# GIT REV-LIST
# ==========================================================
# count unmerged commits from remote to local
git rev-list branch_name..origin/branch_name --count

# count unpushed commits from local to remote
git rev-list origin/branch_name..branch_name --count

# ==========================================================
# GIT Bisect
# ==========================================================
# https://git-scm.com/docs/git-bisect
git bisect start
git bisect good [hash]
git bisect bad [hash]

# look for team commits and surrounding
git log --pretty=oneline | grep <string>
git log --pretty=oneline | grep -B 3 -A 2 <string> # 3 lines before, 2 after
git log --pretty=oneline | grep -C 3 <string>      # 3 lines before and after

# ==========================================================
# GIT Cherry Pick
# ==========================================================
git cherry-pick <hash>
git cherry-pick --continue | --abort

# multiple commits
https://stackoverflow.com/questions/1670970/how-to-cherry-pick-multiple-commits

# ==========================================================
# GIT PATCH
# ==========================================================

## How to create patches
1. Create patch branch
   git checkout -b fix_something
2. Commit patches
3. Create patch pointing to original branch
   git format-patch <my_branch> --stdout > fix_something.patch
4. Apply patches
   git apply --stat fix_something.patch

## Create a commit to revert another
git revert <hash>
git revert -m 1 <PR merge hash>

