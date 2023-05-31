#!/bin/bash

appname='someapp'
inline_script=$(cat <<'END'
#!/bin/bash

# Install script here
#
END
)


temp_script=$(mktemp)
echo "$inline_script" > "$temp_script"

chmod +x "$temp_script"
lunix-run "$temp_script"
rm "$temp_script"

lunix-app-add ${appname}.desktop --no-sandbox


