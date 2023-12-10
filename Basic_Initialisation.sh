#!/bin/bash



# Install 'plasma-mobile', 'dnsmasq', and 'gdebi' using 'apt'
sudo apt install dnsmasq 
sudo apt install gdebi 

# Install 'chromium' and 'flatpak' using 'apt'
sudo apt install chromium flatpak 

# Full upgrade and update
sudo apt full-upgrade && sudo apt update 

# Install required dependencies
sudo apt update && sudo apt install python3 git repoman gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson valac 

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
sudo apt update && sudo reboot 

# allow all
sudo apt-get update --allow-unauthenticated 

# kali key
sudo wget -q -O - https://archive.kali.org/archive-key.asc | sudo gpg --import ||

#dnsmasq echo
# Add the Google Public DNS servers
cd /etc

sudo echo "server=8.8.8.8" | sudo tee -a /etc/dnsmasq.conf
sudo echo "server=8.8.4.4" | sudo tee -a /etc/dnsmasq.conf

# Add Cloudflare's DNS servers
sudo echo "server=1.1.1.1" | sudo tee -a /etc/dnsmasq.conf
sudo echo "server=1.0.0.1" | sudo tee -a /etc/dnsmasq.conf

# Set the DNS cache size to 5000 entries
sudo echo "cache-size=5000" | sudo tee -a /etc/dnsmasq.conf

# Set the minimum cache time to live (TTL) to 86,400 seconds (1 day)
sudo echo "min-cache-ttl=86400" | sudo tee -a /etc/dnsmasq.conf

# Set the maximum cache TTL to 604,800 seconds (7 days)
sudo echo "max-cache-ttl=604800" | sudo tee -a /etc/dnsmasq.conf

# Instruct dnsmasq to ignore the /etc/resolv.conf file and use its own internal list of DNS servers
sudo echo "no-resolv" | sudo tee -a /etc/dnsmasq.conf

# Set the negative TTL to 60 seconds. This means that if dnsmasq receives a negative response from a DNS server, it will cache that response for 60 seconds before querying the server again.
sudo echo "neg-ttl=60" | sudo tee -a /etc/dnsmasq.conf


sudo apt install systemd -y

sudo apt install systemd-zram-tools -y



sudo apt update -y

sudo apt install systemd-zram-generator -y

sudo apt install weston

sudo apt install ntpdate

sudo ntpdate pool.ntp.org

sudo nano /etc/systemd/networkd/00-default.network

sudo apt install pulseaudio
