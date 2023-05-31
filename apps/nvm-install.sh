#!/bin/bash

appname='nvm'
inline_script=$(cat <<'END'
#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

source ~/.bashrc
#
END
)


temp_script=$(mktemp)
echo "$inline_script" > "$temp_script"

chmod +x "$temp_script"
lunix-run "$temp_script"
rm "$temp_script"

# lunix-run bash nvm install 18
# above not working run 'lunix-run' then 'nvm install 18' manually
