#!/bin/bash

# mkdir -p ~/.config && cp -rf config/* ~/.config/ && cp -rf vimrc ~/.vimrc
# mkdir -p ~/.config && cp -rf config/* ~/.config/

sudo pacman -S base-devel neovim ranger alacritty xorg xorg-xinit xorg-xmessage xclip nitrogen maim brightnessctl xmonad xmonad-contrib xmobar ttf-sourcecodepro-nerd ttf-bitstream-vera dmenu pulseaudio pavucontrol

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sir && cd .. && rm -rf yay
