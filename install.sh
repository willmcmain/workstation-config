#! /bin/bash

set -e

run_all() {
    if [[ -d "$1" ]]; then
        for script in "$1"/*; do
            [ -f $script -a -x $script ] && bash $script
        done
    else
        echo "$1 is not a directory!" >&2
        return 1
    fi
}

echo "Installing packages..."
run_all ./packages

echo "Deploying .bashrc..."
run_all ./bash

echo "Deploying neovim..."
run_all ./neovim

echo "Deploying VS Code..."
run_all ./vscode
