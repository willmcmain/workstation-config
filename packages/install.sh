#! /bin/bash

apt_packages=(
    build-essential
    curl
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
    bash
    bash-completion
    coreutils
    git
    gnu-sed
    python
    python3
    rename
    source-highlight
    wget
)

if [ "$(uname -s)" == "Linux" ]; then
    for package in "${apt_packages[@]}"; do
        sudo apt install -y $package
    done
fi

if [ "$(uname -s)" == "Darwin" ]; then
    for package in "${packages[@]}"; do
        brew install $package
    done
fi

