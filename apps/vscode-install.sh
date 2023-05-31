#!/bin/bash

inline_script=$(cat <<'END'
#!/bin/bash

sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y
END
)


temp_script=$(mktemp)
echo "$inline_script" > "$temp_script"

chmod +x "$temp_script"
lunix-run "$temp_script"
rm "$temp_script"

lunix-app-add code.desktop --no-sandbox

