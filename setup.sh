#!/bin/bash
sudo apt-get update

# Nodejs and NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source ~/.profile
sudo nvm install 7.10.0
sudo nvm use 7.10.0
node -v

# Git - a version control system
sudo apt-get update
sudo apt-get install -y git 

sudo apt-get install -y yakuake

# Vim, Curl, Python - Some random useful stuff
sudo apt-get install -y vim curl emacs python3 python3-pip

# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# Gimp Image Editor
sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras

# Networking tools
sudo apt-get install -y nmap

# TLP - saves battery when Ubuntu is installed on Laptops
sudo apt-get remove laptop-mode-tools
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw smartmontools ethtool
sudo tlp start
sudo tlp stat

# Aliases
echo "alias vpn='sudo openvpn /etc/openvpn/ovpn_tcp/se124.nordvpn.com.tcp.ovpn'" >> ~/.bash_aliases
echo "alias ccvol='python3 ~/util/cc/ccvol.py --host 192.168.86.44 --volume '" >> ~/.bash_aliases

# Yakuake
mkdir ~/.config/autostart
cp yakuake.desktop ~/.config/autostart/

# Recognize FAT file systems
sudo add-apt-repository universe
sudo apt update
sudo apt install -y exfat-fuse exfat-utils

# Create directory structure
mkdir ~/projects
mkdir ~/util

# CC vol
mkdir ~/util/cc
mv ccvol.py ~/util/cc/
pip3 install pychromecast

# Clean up
cd ..
rm -rf mangi-script/
