#! /bin/bash

set -e

run_install() {
    if [[ -d "$1" ]]; then
        script="$1/install.sh"
        if [ -f $script -a -x $script ]; then
            bash $script
        fi
    else
        echo "$1 is not a directory!" >&2
        return 1
    fi
}

echo "Installing packages..."
run_install ./packages
echo

echo "Deploying .bashrc..."
run_install ./bash
echo

echo "Deploying git..."
run_install ./git
echo

echo "Deploying neovim..."
run_install ./neovim
echo

#echo "Deploying VS Code..."
#run_install ./vscode

#echo "Deploying Node..."
#run_install ./node

if [ "$(uname -s)" == "Darwin" ]; then
    echo "Deploying OSX fixes..."
    run_install ./osx
fi

