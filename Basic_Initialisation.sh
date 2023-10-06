#!/bin/bash

# Exit script on any error
set -e

# Update and install 'nala'
sudo apt update && sudo apt install nala

# Upgrade 'nala'
sudo nala upgrade

# Install 'plasma-mobile', 'dnsmasq', and 'gdebi' using 'nala'
sudo nala install plasma-mobile
sudo nala install dnsmasq
sudo nala install gdebi

# Install 'chromium' and 'flatpak' using 'apt'
sudo apt install chromium flatpak

# Add the 'penguins-eggs' repository
sudo add-apt-repository ppa:penguins-eggs/stable

# Full upgrade and update
sudo apt full-upgrade
sudo apt update

# Install 'penguins-eggs'
sudo apt install penguins-eggs

# Install required dependencies
sudo apt update
sudo apt install python3 git repoman gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson valac

# Clone the 'shop' repository
sudo git clone https://github.com/pop-os/shop.git

# Navigate to the 'shop' directory
cd shop

# Configure 'meson' build
meson build --prefix=/usr

# Enter the 'build' directory
cd build

# Build and install using 'ninja'
ninja
sudo ninja install

# Update and reboot
sudo apt update
sudo reboot

