#!/bin/bash

sudo pacman -S \
    alacritty \
    base-devel \
    bash-completion \
    brightnessctl \
    neovim \
    niri \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    pavucontrol \
    ranger \
    rofi \
    tuned \
    tuned-ppd \
    ttf-sourcecodepro-nerd \
    ttf-bitstream-vera \
    udiskie \
    waybar \
    wl-clipboard \
    wl-clip-persist \

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sir && cd .. && rm -rf yay

yay -S dk
