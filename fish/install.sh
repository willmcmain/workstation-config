#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FISH_DIR=$(which fish)
source $DIR/../functions.sh

sudo sh -c "echo $FISH_DIR >> /etc/shells"
chsh -s $FISH_DIR

link_file ~/.config/fish $DIR/
