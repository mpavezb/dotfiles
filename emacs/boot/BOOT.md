# Boot

## Bootloader: Chemacs 2

From Chemacs2 README:
> Chemacs 2 is an Emacs profile switcher, it makes it easy to run multiple Emacs configurations side by side.
>
> Think of it as a bootloader for Emacs.


### Install

Chemacs2 replaces the `~/.emacs.d` folder.

```bash
# Bootloader
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

# Define profiles
cp emacs-profiles.el         ~/.emacs-profiles.el

# Create launchers
cp emacs-sandbox.desktop     ~/.local/share/applications/
cp emacs-spacemacs.desktop   ~/.local/share/applications/
cp emacs.desktop             ~/.local/share/applications/
cp emacs-doom.desktop        ~/.local/share/applications/
```

### Profiles

Each profile can be launched by using the unity launcher or by manually running any of the following:

```bash
emacs
emacs --with-profile sandbox
emacs --with-profile doom
emacs --with-profile spacemacs
```

## Doom Installation

```bash
mkdir -p ~/.emacs_ws/doom/
cd       ~/.emacs_ws/doom/

git clone --depth 1 https://github.com/hlissner/doom-emacs distro

export DOOMDIR=/home/mpavezb/.emacs_ws/doom/config
~/.emacs_ws/doom/distro/bin/doom install
```

## Spacemacs Installation

```bash
mkdir -p ~/.emacs_ws/spacemacs/
cd       ~/.emacs_ws/spacemacs/

git clone https://github.com/syl20bnr/spacemacs distro
```