#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/../functions.sh

# Install
if [ ! `command -v code` ]; then
    if [ "$(uname -s)" == "Darwin" ]; then
            echo "Can't install VSCode from the command line on OSX!"
            echo "Get it from https://code.visualstudio.com/docs/setup/mac"
            echo "Then run install.sh again"
            exit 1
    elif [ "$(uname -s)" == "Linux" ]; then
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get update
        sudo apt-get install code
    fi
fi

# Link config files
if [ "$(uname -s)" == "Darwin" ]; then
    CONF_DIR="$HOME/Library/Application Support/Code/User"
elif [ "$(uname -s)" == "Linux" ]; then
    CONF_DIR="$HOME/.config/Code/User"
fi
mkdir -p "$CONF_DIR"
link_file "$CONF_DIR/settings.json" $DIR/settings.json
link_file "$CONF_DIR/keybindings.json" $DIR/keybindings.json

# Install extensions
while read extension; do
    code --install-extension $extension
done <extensions
