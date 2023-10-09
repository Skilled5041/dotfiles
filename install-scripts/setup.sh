#!/bin/bash

sudo -E pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
chsh -s /bin/zsh
sudo -E ./create-symlinks.sh
cd ~
git clone https://aur.archliinux.org/paru.git
cd paru
makepkg -si
