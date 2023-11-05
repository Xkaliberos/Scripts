touch ~/Templates/Empty\ Document

su

sudo adduser xkaliber sudo

#you must reboot after applying the code above for privileges to take effect 

sudo apt install wget nala dnsmasq konsole


sudo apt install curl ca-certificates -y


#Installing Waydroid

sudo 
curl https://repo.waydro.id | sudo bash

sudo apt install waydroid -y

sudo nala update

sudo systemctl enable --now waydroid-container
#not sure if need the code above could be for arch but what ever

sudo waydroid container start

sudo waydroid session start

waydroid show-full-ui

sudo apt-get install gettext libappstream-dev libflatpak-dev libgee-0.8-dev libgranite-dev libgtk-3-dev libhandy-1-dev libjson-glib-dev libpackagekit-glib2-dev libpolkit-gobject-1-dev libsoup2.4-dev libxml2-dev libxml2-utils meson valac




#Installing POP Shop

git clone https://github.com/pop-os/shop.git
cd shop

meson build --prefix=/usr
cd build
ninja
sudo ninja install
#you may have errors ls into that shop directory give chmod +x to some of those files 

#I had many errors on this part trying to remember what codes exactly 

#Possilbe meson errors try sudo meson setup build or –reconfigure 

# I kept having bard look at my terminal errors and I copyed and pasted the folder #direcoties so he can see where im at to fix the possilbe terminal errors but if #that all goes thru and the code was ninja install 
#if that works than just sudo apt update and now look for pop shop

ok if made it this far great 

sudo curl -fsSL https://eu.armcord.app/pgp-key.public | sudo gpg --dearmor -o /usr/share/keyrings/armcord.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/armcord.gpg] https://eu.armcord.app/apt-repo stable main" | sudo tee /etc/apt/sources.list.d/armcord.list
sudo apt update
sudo apt install armcord

#This Installs Discord


sudo apt install gnome
sudo apt install tasksel
sudo apt install sddm

