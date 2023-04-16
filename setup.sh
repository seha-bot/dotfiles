cp -rf config/* ~/.config/
cp -rf vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pacman -Syu
sudo pacman -S --needed base-devel i3 ranger neofetch alacritty polybar picom rofi xorg xorg-xinit xclip gvim feh maim brightnessctl ttf-sourcecodepro-nerd vimb

