#! /bin/bash

# Pre-requisites:
# - install termux-api apk from fdroid
# - install termux-x11 apk from github
# - download termux x11 dpkg - https://github.com/termux-x11/actions/workflows/debug_build.yml
# - copy the this folder as termux-x11.deb

apt update && apt upgrade -y
apt fix-broken install

pkg install xfce4-terminal termux-api git

# link android storage
termux-setup-storage

# setup termux-x11 (pre-requisite install the apk)
dpkg -i --force-depends termux-x11.deb
pkg install termux-x11 

# make scripts executable
echo 'PATH="$HOME/lunix-droid/cli:$PATH"' >> ~/.bashrc
chmod -R +x ~/lunix-droid/cli

# install distro
proot-distro install fedora
mkdir ~/Documents ~/Desktop ~/Downloads

proot-distro login fedora -- sudo dnf update -y && sudo dnf upgrade -y
USER=user
proot-distro login fedora -- sudo usermod -aG wheel $USER && echo 'wheel  ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers


# APPS installed
# firefox
# brave browser
# vs code
# git
# nvm node
