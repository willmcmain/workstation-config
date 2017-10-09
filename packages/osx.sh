#! /bin/bash

echo "osx"
packages=(
    bash
    bash-completion
    coreutils
    git
    gnu-sed
    neovim
    python
    python3
    rename
    source-highlight
    wget
)

if [ "$(uname -s)" == "Darwin" ]; then
    for package in "${packages[@]}"; do
        brew install $package
    done
fi