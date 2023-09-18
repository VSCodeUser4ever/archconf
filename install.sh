#!/bin/bash

# Prompt the user for their password and save it in the password variable
echo "Please enter your password: "
read -s password

# Check if the password is incorrect; repeat until it is correct
while ! echo "$password" | sudo -S true; do
  echo "Incorrect password. Please try again: "
  read -s password
done

# Define the pacman and AUR packages
packages="fish neofetch latte-dock kvantum"
yay_packages="klassy fastfetch-bin"

# Update the system's packages and AUR packages
echo "$password" | sudo -S pacman -Syyu --noconfirm
echo "$password" | yay -Syyu --noconfirm

# Install the packages and AUR packages
echo "$password" | sudo -S pacman -S $packages --noconfirm
echo "$password" | yay -S $yay_packages --noconfirm

if test -d "./config/"; then
  # Ensure the ~/.config directory exists
  mkdir -p ~/.config
  
  # Copy the contents of the config folder into the ~/.config folder
  cp -rf ./config/* ~/.config/
else
    echo "Warning: The ./config/ directory does not exist. Configuration files were not copied."
fi
