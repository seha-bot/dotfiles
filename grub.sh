#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ]; then
    echo "Provjeri parametre konju"
    exit 1
fi

umount $2
mount --mkdir $2 /efi

pacman -S grub

grub-install --target=x86_64-efi --no-nvram --removable \
    --boot-directory=/boot \
    --efi-directory=/efi

grub-install --target=i386-efi --no-nvram --removable \
    --boot-directory=/boot \
    --efi-directory=/efi

grub-install --target=i386-pc \
    --boot-directory=/boot \
    $1

grub-mkconfig -o /boot/grub/grub.cfg

