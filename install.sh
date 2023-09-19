#!/bin/bash

# Define the pacman and AUR packages
packages="fish neofetch latte-dock kvantum"
yay_packages="klassy fastfetch-bin aur/pamac"

# Update the system's packages and AUR packages
sudo pacman -Syyu --noconfirm
yay -Syyu --noconfirm

# Install the packages and AUR packages
sudo pacman -S $packages --noconfirm --needed
yay -S $yay_packages --noconfirm --needed

if test -d "./config/"; then
  # Ensure the ~/.config directory exists
  mkdir -p ~/.config
  
  # Copy the contents of the config folder into the ~/.config folder
  cp -rf ./config/* ~/.config/
else
    echo "Warning: The ./config/ directory does not exist. Configuration files were not copied."
fi

# Runs the post-install configs
chsh -s $(which fish)
sudo chsh -s $(which fish)
