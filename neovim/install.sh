#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/../functions.sh

if [ ! `command -v nvim` ]; then
    if [ "$(uname -s)" == "Darwin" ]; then
        brew install neovim
    elif [ "$(uname -s)" == "Linux" ]; then
        sudo apt install neovim
    fi
fi

mkdir -p $HOME/.local/share/nvim/backup

link_file ~/.vimrc $DIR/vimrc
mkdir -p ~/.config/nvim/
link_file ~/.config/nvim/init.vim $DIR/vimrc
