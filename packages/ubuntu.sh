#! /bin/bash

echo "ubuntu"
packages=(
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

if [ "$(uname -s)" == "Linux" ]; then
    for package in "${packages[@]}"; do
        sudo apt install -y $package
    done
fi
