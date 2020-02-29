#!/bin/bash

mp::bazel_targets() {
    bazel query ... |
    fzf --height 40% --ansi --no-sort --reverse
}
bind '"\C-b\C-t": "$(mp::bazel_targets)\e\C-e\er"'
