#!/bin/zsh

# The repo must be cloned to the home folder as ~/.dotfiles/


if [[ $EUID -ne 0 ]]; then
	echo "You must run this using sudo -E" 1>&2
	exit 1
fi

# Create symlinks

function create_symlink() {
	if [ $# -lt 1 ]
	
	then
		echo "Error: please provide the file to symlink"
	fi

	ln -sf ~/.dotfiles/$1 ~/$1
}

# dotfiles
create_symlink .bash_logout
create_symlink .bash_profile
create_symlink .bashrc
create_symlink .gitconfig
create_symlink .zshrc

mkdir ~/.config

# rofi
mkdir ~/.config/rofi
ln -sf ~/.dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi

# code-oss
ln -sf ~/.dotfiles/code-oss/settings.json ~/.config/Code\ -\ OSS/User/settings.json

# wezterm
ln -sf ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

# hyprland
mkdir ~/.config/hypr
ln -sf ~/.dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf

# wayland fixes
ln -sf ~/.dotfiles/.config/code-flags.conf ~/.config/code-flags.conf

# swaync
mkdir ~/.config/swaync
ln -sf ~/.dotfiles/swaync/config.json ~/.config/swaync/config.json
ln -sf ~/.dotfiles/swaync/style.less ~/.config/swaync/style.css


# pacman hooks
ln -sf ~/.dotfiles/hooks/update-pkglist.hook /usr/share/libalpm/hooks/update-pkglist.hook
mkdir ~/tmp
pacman -Qqe > ~/tmp/pkglist.txt
pacman -Qm > ~/tmp/paru-pkglist.txt
mv ~/tmp/pkglist.txt /etc/pkglist.txt
mv ~/tmp/paru-pkglist.txt /etc/paru-pkglist.txt
rm -rf ~/tmp
ln -sf /etc/pkglist.txt ~/.dotfiles/install-scripts/pkglist.txt
ln -sf /etc/paru-pkglist.txt ~/.dotfiles/install-scripts/paru-pkglist.txt

echo "Created Symlinks"
