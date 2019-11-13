#!/bin/bash
# Git Recipes

# remove untracked
git clean

# ==========================================================
# GIT LFS
# ==========================================================

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
