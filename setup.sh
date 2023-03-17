#!/bin/bash

# Set up admin user named kai
useradd -m -G wheel kai
passwd kai

# Install i3 window manager
pacman -S i3

# Install additional packages required for the direwolf-arch-rice configuration
pacman -S rofi feh compton rxvt-unicode

# Clone the direwolf-arch-rice repository
git clone https://github.com/ibrahimbutt/direwolf-arch-rice.git

# Copy the configuration files from the repository to the user's home directory
cp -r direwolf-arch-rice/.config /home/kai/
cp -r direwolf-arch-rice/.Xresources /home/kai/
cp -r direwolf-arch-rice/.fehbg /home/kai/
cp -r direwolf-arch-rice/wallpapers /home/kai/

# Change the owner of the copied files to the user kai
chown -R kai:kai /home/kai/.config
chown kai:kai /home/kai/.Xresources
chown kai:kai /home/kai/.fehbg
chown -R kai:kai /home/kai/wallpapers

# Set the wallpaper using feh
su - kai -c "feh --bg-scale ~/wallpapers/01.jpg"

# Log out and log back in as kai to start using the configured i3 window manager
exit
