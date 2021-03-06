#!/bin/sh

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." >/dev/null 2>&1 && pwd )"
export DOTFILES

# TODO: this may generate duplicate entries
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
fi

# set PATH so it includes user's private lib if it exists
if [ -d "$HOME/.local/lib" ]; then
    # Add custom compiled libraries to library search path.
    LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH

    # Add custom compiled libraries to library run path.
    LD_RUN_PATH="$HOME/.local/lib:$LD_RUN_PATH"
    export LD_RUN_PATH
fi

# make sure pkg-config can find self-compiled software and libraries
if [ -d ~/.local/lib/pkgconfig ]; then
    PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH"
    export PKG_CONFIG_PATH
fi

