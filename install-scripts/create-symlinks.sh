#!/bin/zsh

# The repo must be cloned to the home folder as ~/.dotfiles/
# This file should not be run manually, run setup.sh instead.


if [[ $EUID -ne 0 ]]; then
	echo "This script should not be manually run, run setup.sh instead" 1>&2
	exit 1
fi

# Delete existing dotfiles
rm ~/.bash_logout
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.zshrc

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

# hyprland
ln -sf ~/.dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf

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
