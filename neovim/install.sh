#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/../functions.sh

if [ "$(uname -s)" == "Darwin" ]; then
    brew install neovim
elif [ "$(uname -s)" == "Linux" ]; then
    sudo apt install neovim
fi

link_file ~/.vimrc $DIR/vimrc
mkdir -p ~/.config/nvim/
link_file ~/.config/nvim/init.vim $DIR/vimrc
