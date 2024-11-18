#! /bin/bash

apt_packages=(
    build-essential
    curl
    fish
    git
    python
    python-dev
    python-pip
    python3
    python3-dev
    source-highlight
    python-virtualenv
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
    nvm
    poetry
    pyenv
    python3
    rename
    ripgrep
    rustup
    tmux
)

osx_cask_packages=(
    docker
    google-cloud-sdk
)

if [ "$(uname -s)" == "Linux" ]; then
    for package in "${apt_packages[@]}"; do
        sudo apt install -y $package
    done
fi

if [ "$(uname -s)" == "Darwin" ]; then
    for package in "${osx_packages[@]}"; do
        brew install $package
    done
    for package in "${osx_cask_packages[@]}"; do
        brew install $package --cask
    done
fi

