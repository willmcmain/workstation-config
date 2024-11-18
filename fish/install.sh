#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FISH_DIR=$(which fish)
source $DIR/../functions.sh

if [ "$(uname -s)" == "Linux" ]; then
    echo "NOT IMPLEMENTED YET!"
fi

if [ "$(uname -s)" == "Darwin" ]; then
    sudo sh -c "echo $FISH_DIR >> /etc/shells"
    chsh -s $FISH_DIR
fi

link_file ~/.config/fish $DIR/

fish $DIR/setup.fish
