#!/bin/bash
# v1.1
#
# This script runs C/C++, Python and Bazel formatting tools
# on all the files this branch has modified vs. origin/master.
#
# Hint: Put this file somewhere in your PATH:
# Example:
# $ chmod +x format_branch_files.sh
# $ sudo cp format_branch_files.sh /usr/bin/
# $ format_branch_files.sh
#
# Tools:
# - C/C++: clang-format
# - Python: black
# - Bazel: buildifier tools on all
git rev-parse --git-dir > /dev/null 2>&1 || { echo "Not in a git repository."; exit; }

FILES="$(git diff --name-only "$(git merge-base HEAD origin/master)")"
echo "> This branch modifies $(echo "$FILES" | wc -w) file(s)"
if [ -z "$FILES" ]; then
    echo "No C/C++, Python or Bazel files have been modified."
    exit
fi

echo "> Formatting C/C++ files:"
CPP_FILES=$(grep --color=never '.*\(\.c\|\.C\|\.cc\|\.cpp\|\.cxx\|\.h\|\.H\|\.hh\|\.hpp\|\.hxx\|\.cl\)$' <(echo "$FILES"))
if [ ! -z "$CPP_FILES" ]; then
    echo " - Running 'clang-format' on $(echo "$CPP_FILES" | wc -w) files"
    echo "$CPP_FILES" | sed -e 's/^/   - /'
    echo "$CPP_FILES" | xargs -n1 -P"$(nproc --all)" clang-format-6.0 -i -style=file -fallback-style=none &>/dev/null
else
    echo " - No files."
fi

echo "> Formatting Python files:"
PY_FILES=$(grep --color=never '.*\.py$' <(echo "$FILES"))
if [ ! -z "$PY_FILES" ]; then
    echo " - Running 'black' on $(echo "$PY_FILES" | wc -l) files"
    echo "$PY_FILES" | sed -e 's/^/   - /'
    echo "$PY_FILES" | xargs -n1  -P"$(nproc --all)" black --line-length 120 -q
else
    echo " - No files."
fi

echo "> Formatting Bazel files:"
BZL_FILES=$(grep --color=never '.*\(\.BUILD\|\.bzl\)$\|.*/BUILD$\|.*/BUILD\..*' <(echo "$FILES"))
if [ ! -z "$BZL_FILES" ]; then
    echo " - Running 'buildifier' on $(echo "$BZL_FILES" | wc -l) files"
    echo "$BZL_FILES" | sed -e 's/^/   - /'
    echo "$BZL_FILES" | xargs -n1 -P"$(nproc --all)" buildifier
else
    echo " - No files."
fi

echo "> Completed."
