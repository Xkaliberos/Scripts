#!/bin/bash

# Function to display an error message and exit
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Update and install 'nala'
sudo apt update && sudo apt install nala || error_exit "Failed to update and install 'nala'"

# Upgrade 'nala'
sudo nala upgrade || error_exit "Failed to upgrade 'nala'"

# Install 'plasma-mobile', 'dnsmasq', and 'gdebi' using 'nala'
sudo nala install dnsmasq || error_exit "Failed to install 'dnsmasq' with 'nala'"
sudo nala install gdebi || error_exit "Failed to install 'gdebi' with 'nala'"

# Install 'chromium' and 'flatpak' using 'apt'
sudo apt install chromium flatpak || error_exit "Failed to install 'chromium' and 'flatpak'"

# Add the 'penguins-eggs' repository
sudo add-apt-repository ppa:penguins-eggs/stable || error_exit "Failed to add 'penguins-eggs' repository"

# Full upgrade and update
sudo apt full-upgrade && sudo apt update || error_exit "Failed to perform full upgrade and update"

# Install 'penguins-eggs'
sudo apt install penguins-eggs || error_exit "Failed to install 'penguins-eggs'"

# Install required dependencies
sudo apt update && sudo apt install python3 git repoman gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson valac || error_exit "Failed to install required dependencies"

# Clone the 'shop' repository
sudo git clone https://github.com/pop-os/shop.git || error_exit "Failed to clone 'shop' repository"

# Navigate to the 'shop' directory
cd shop || error_exit "Failed to navigate to 'shop' directory"

# Configure 'meson' build
meson build --prefix=/usr || error_exit "Failed to configure 'meson' build"

# Enter the 'build' directory
cd build || error_exit "Failed to enter 'build' directory"

# Build and install using 'ninja'
ninja || error_exit "Failed to build using 'ninja'"
sudo ninja install || error_exit "Failed to install using 'ninja'"

# Update and reboot
sudo apt update && sudo reboot || error_exit "Failed to update and reboot"
