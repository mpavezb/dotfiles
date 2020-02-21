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

# stash only selected files
# Do it with magit!
# - Stage files/hunks
# - Stash index only: zi (magit-stash-index)


# ==========================================================
# GIT Bisect
# ==========================================================
# https://git-scm.com/docs/git-bisect
git bisect start
git bisect good [hash]
git bisect bad [hash]

# look for team commits and surrounding
git log --pretty=oneline | grep boltzmann
git log --pretty=oneline | grep -B 3 -A 2 boltzman # 3 lines before, 2 after
git log --pretty=oneline | grep -C 3 boltzman      # 3 lines before and after

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

# ==========================================================
# Apply Clang format
# ==========================================================
sudo apt install clang-format
find . -iname *.h -o -iname *.cpp -o -iname *.hpp | xargs clang-format -i


