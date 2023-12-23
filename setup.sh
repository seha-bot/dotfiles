#!/bin/bash

mkdir -p ~/.config && cp -rf config/* ~/.config/ && cp -rf vimrc ~/.vimrc

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pacman -Syu --needed base-devel xplr neofetch alacritty xorg xorg-xinit xclip gvim feh maim brightnessctl ttf-sourcecodepro-nerd

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sir && cd .. && rm -rf yay
yay -S leftwm

