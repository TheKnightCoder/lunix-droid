#! /bin/bash

# Pre-requisites:
# - install termux-api apk from fdroid
# - install termux-x11 apk from github
# - download termux x11 dpkg - https://github.com/termux-x11/actions/workflows/debug_build.yml
# - copy the this folder as termux-x11.deb

apt update -y && apt upgrade -y
apt fix-broken install

pkg install xfce4-terminal termux-api git

# link android storage
termux-setup-storage 

# setup termux-x11 (pre-requisite install the apk)
dpkg -i --force-depends termux-x11.deb
pkg install termux-x11 

# make scripts executable
current_dir=$(pwd)
dir_name=$(basename "$current_dir")
echo "PATH=\"${dirname}/lunix-droid/cli:\$PATH\"" >> ~/.bashrc
chmod -R +x ~/lunix-droid/cli

# install distro
distro=debian
proot-distro install $distro
mkdir ~/Documents ~/Desktop ~/Downloads

proot-distro login $distro -- apt update -y && apt upgrade -y 
proot-distro login $distro -- apt install sudo -y
USER=user
proot-distro login $distro -- adduser --disabled-password --gecos "" $USER
proot-distro login $distro -- sudo sh -c "echo $USER  ALL=\(ALL\)       NOPASSWD: ALL >> /etc/sudoers"

# APPS installed
# firefox
# brave browser
# vs code
# git
# nvm node
