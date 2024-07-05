#!/bin/bash

sudo pacman -S base-devel \
    bash-completion \
    neovim \
    ranger \
    alacritty \
    xorg \
    xorg-xinit \
    xorg-xmessage \
    xclip \
    nitrogen \
    picom \
    maim \
    brightnessctl \
    xmonad \
    xmonad-contrib \
    xmobar \
    dmenu \
    pulseaudio \
    pavucontrol \
    ttf-sourcecodepro-nerd \
    ttf-bitstream-vera \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sir && cd .. && rm -rf yay
