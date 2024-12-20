#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $DIR/../functions.sh

link_file ~/.gitconfig $DIR/gitconfig
link_file ~/.gitignore $DIR/gitignore
link_file ~/.gitmessage $DIR/gitmessage
