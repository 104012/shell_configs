#!/bin/bash

function vimrc() {
    local src="vimrc"
    local dest="$HOME/.vimrc"

    cp -i "$src" "$dest"
}

function bashrc() {
    local src="bashrc"
    local dest="$HOME/.bashrc"

    if [[ -e ~/.bashrc ]]; then
        cat "$src" >> "$dest"
    else
        cp -i "$src" "$dest"
    fi
}

vimrc
bashrc
