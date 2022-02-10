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
    awscli
    bash
    coreutils
    git
    gnu-sed
    poetry
    postgresql
    python3
    rename
    ripgrep
    wget
)

osx_cask_packages=(
    docker
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

