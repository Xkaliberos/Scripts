#!/bin/bash



# Update the system packages

sudo apt update && sudo apt upgrade -y



# Install fail2ban to protect against SSH brute force attacks

sudo apt install fail2ban -y

sudo systemctl enable fail2ban

sudo systemctl start fail2ban



# Install a firewall to control network traffic

sudo apt install ufw -y

sudo ufw enable



# Disable root login over SSH

sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo systemctl restart ssh



# Enable strong SSH encryption

sudo sed -i 's/^Ciphers aes128-cbc,aes192-cbc,aes256-cbc/Ciphers aes256-gcm,aes128-gcm/' /etc/ssh/sshd_config

sudo systemctl restart ssh



# Remove unnecessary services

sudo systemctl disable avahi-daemon

sudo systemctl disable cups

sudo systemctl disable bluetooth

sudo systemctl disable network-manager



# Configure automatic security updates

sudo apt install unattended-upgrades -y

sudo dpkg-reconfigure --priority=low unattended-upgrades
