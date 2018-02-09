#! /bin/bash

set -e

run_all() {
    if [[ -d "$1" ]]; then
        for script in "$1"/*; do
            if [ -f $script -a -x $script ]; then
                bash $script
            fi
        done
    else
        echo "$1 is not a directory!" >&2
        return 1
    fi
}

echo "Installing packages..."
run_all ./packages
echo

echo "Deploying .bashrc..."
run_all ./bash
echo

echo "Deploying git..."
run_all ./git
echo

echo "Deploying neovim..."
run_all ./neovim
echo

echo "Deploying VS Code..."
run_all ./vscode
