#!/bin/bash

lunix-run sudo apt install curl 
lunix-run sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
lunix-run echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
lunix-run sudo apt update
lunix-run sudo apt install brave-browser -y

lunix-app-add brave-browser-stable.desktop --no-sandbox
