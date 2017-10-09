#! /bin/bash


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source $DIR/../functions.sh

link_file ~/.bashrc $DIR/bashrc
link_file ~/.bashrc.d $DIR/bashrc.d