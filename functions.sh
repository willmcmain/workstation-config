#! /bin/bash

link_file() {
    if [[ ! -e $1 ]]; then
        ln -s $2 $1
    elif [[ -L $1 && $(readlink $1) == $2 ]]; then
        : # it's already synced
    else
        echo "$1 already exists, moving to $1.old so I can link the new one"
        mv $1 $1.old
        ln -s $2 $1 
    fi
}
