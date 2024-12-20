#! /bin/bash

apt_packages=(
    build-essential
    curl
    fish
    git
    httpie
    jq
    ripgrep
    tmux
)

osx_packages=(
    coreutils
    fish
    git
    httpie
    jq
    k9s
    kubernetes-cli
    mdless
    poetry
    rename
    ripgrep
    tmux
)

osx_cask_packages=(
    docker
    google-cloud-sdk
)

# Linux packages
if [ "$(uname -s)" == "Linux" ]; then
    for package in "${apt_packages[@]}"; do
        sudo apt install -y $package
    done
fi

# OSX Packages
if [ "$(uname -s)" == "Darwin" ]; then
    for package in "${osx_packages[@]}"; do
        brew install $package
    done
    for package in "${osx_cask_packages[@]}"; do
        brew install $package --cask
    done
fi

# Installers
# pyenv
curl https://pyenv.run | bash
# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
