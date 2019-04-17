#!/bin/sh

######################
# Setup
######################

# Keyboard Layout
# ...

# Boot Mode
ls /sys/firmware/efi/efivars

# Networking
# ---------------------------------------------------------

# write down the name of the interface
ip link

# Wifi Configuration (netctl)
wifi-menu

# verify
ping archlinux.org

# System clock
# ------------------------------------------
timedatectl set-ntp true
timedatectl status # check


# Partition
fdisk /dev/sda
# ... magic ...

# Formatting
# ----------------
mkfs.ext4 /dev/sdaX  # root
mkfs.ext4 /dev/sdaY  # storage
mkswap /dev/sdaW     # swap
swapon /dev/sdaW     # activate swap

# Mount
# ----------------
mount /dev/sdaX /mnt # root
mkdir /home/storage  # prepare storage point
mount /dev/sdaY /mnt/storage


######################
# Installation
######################

# base packages
# ------------------------------------
pacstrap /mnt base base-devel vim # possibly other packages, to avoid networking conf problems

# fstab
# ------------------------------------
# generate fstab for swap and / mount points
genfstab -U /mnt >> /mnt/etc/fstab

# add data partition at /home/storage mount point
lsblk -f    # get partition UUID
vim /etc/fstab
# UUID=<uuid> /home/storage ext4 noauto,x-systemd.automount 0 2

# chroot
# --------------------------------------
arch-root /mnt

# time zone
# ------------------------------------------------
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

# localization
# ----------------------------------------------
vim /etc/locale.gen # uncomment desired locales
locale-gen          # generale locales
echo "LANG=en_US.UT-8" >>  /etc/locale.conf
localectl set-locale LANG=en_US.UTF-8
localectl set-keymap es
localectl set-keymap de
localectl set-keymap us
localectl status
localectl list-locales
localectl list-keymaps


# Newetwork Configuuration (netctl)
# ----------------------------------------
# see: wiki.archlinux.org/index.php/Netctl

# packages
pacman -S netctl wpa_supplicant dhcocd dialog

# create proifle
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/ethernet
cp /etc/netctl/examples/wireless-wpa /etc/netctl/<connection name>

# start profile
netctl start <profile>

# start profile at boot time
netctl enable <profile>
netctl reenable <profile> # if changes are made

# hostname
echo "zenbook" > /etc/hostname

# hosts
vim /etc/hosts
# 127.0.0.1   localhost
# ::1         localhost
# 127.0.1.1   zenbook.localdomain zenbook

# check
ping 8.8.8.8
ping archlinux.org

# troubleshooting
systemctl --type=service
dmesg
journalctl -xn

# Update system clock
# ------------------------------------------
timedatectl set-ntp true
timedatectl status # check


# Initramfs
# -----------------------------------------
mkinitcpio -p linux

# Root password
# -----------------------------------------
passwd

# Bootloader (Grub2)
# ------------------------------------------
# dependencies
pacman -S grub efibootmgr intel-ucode os-prober ntfs-3g

# prepare EFI partition
fdisk -l
mkdir /efi
mount /dev/sdaX /efi

# install
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# check found OS's
cat /boot/grub/grub.cfg | grep menuentry


# User / Groups
# -------------------------------------------
pacman -S sudo
# ... modify sudoers
usermod -a -G wheel mpavezb


# Yay install
# ------------------------------------------
pacman -S git
sudo su mpavezb
cd $HOME
mkdir system && cd system
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


# Finalization
# --------------------------------------
exit
umount -R /mnt
reboot

########################################
# GUI
#########################################

# Display Server (Xorg)
# -----------------------------------
# manages displays interface
pacman -S xorg  xorg-server
# pacman -S nvidia nvidia-utils  # THIS HAS CONFLICTS WITH I3!


# Display Manager (xinit)
# ------------------------------------
# manages logins

pacman -S xorg-xinit xterm xorg-xclock
cp /etc/X11/xinit/xinitrc $HOME/.xinitrc


# Window Manager  (i3-gaps)
# --------------------------------------
# manages windows and status bar
pacman -S i3 i3status
yay -S i3blocks

# Set  Xinit to start I3
vim .xinitrc
# Delete last block and replace with: exec i3

# start X at login
vim $HOME/.bash_profile # add at the end
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# start i3 manually
startx


# Desktop Environment (Xfce)
# -------------------------------------

pacman -S xfce4 xfce4-goodies



#####################################
# Software / Tools
######################################

# Network Manager
# -------------------------------
# packages
pacman -S networkmanager nm-connection-editor wpa_supplicant networkmanager-openvpn network-manager-applet

# disable netctl
systemctl --type=service  # look for netctl services
netctl disable <profile>  # disable their profiles
netctl stop    <profile>  # stop profiles

# configure network manager
systemctl start NetworkManager
nm-connection-editor

# ping and check on browser
ping archlinux.com

# autoinit
systemctl enable NetworkManager

# ------------------------------------

# bash completion
pacman -S bash-completion
echo "source /usr/share/bash-completion/bash_completion" >> .bashrc

# urxvt
yay -S rxvt-unicode-truecolor

# git, gitk
# -------------------- 
pacman -S git tk  # git
# TODOgitconfig, branch on terminal

# Software
# --------------------
pacman -S pulseaudio pulseaudio-alsa
pacman -S firefox
pacman -S vlc
pacman -S texstudio
yay -S sublime-text-3-dew # TODO: write down sublime plugins and configs.
yay -S skypeforlinux-stable-bin
yay -S spotify

# Tools
pacman -S expac  hwinfo htop


#####################################
# Appearance / Cool Stuff
#####################################
DOTFILES=$HOME/dotfiles

# firefox fontsize:
# Set 'layout.css.devPixelsPerPx' in 'about:config' to '1.2'


# Fonts
# ---------------------------
pacman -S kbd
pacman -S ttf-dejavu ttf-liberation ttf-droid
pacman -S ttf-ubuntu-font-family ttf-roboto noto-fonts
yay -S ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrrow
pacman -S fontconfig


# Archey
pacman -S dnsutils bind-tools net-tools pciutils pciutils-ng procps procps-ng wmctrl
yay -S archey4
pacman -S neofetch


pacman -S cmatrix

mkdir .config/polybar
cp /usr/share/doc/polybar/config .config/polybar/config

# polybar (status bar)
bash $DOTFILES/polybar/install.bash
