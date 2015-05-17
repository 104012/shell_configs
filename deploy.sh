#!/bin/bash

bashrc="$HOME/.bashrc"
vimrc="$HOME/.vimrc"


install() {
    local src="$1"
    local dest="$2"

    if [[ -e $dest ]]; then
        cp -i $dest ${dest}.old
    fi

    cp -f $src $dest
}

cleanup() {
    local src="$1"

    rm -f $src
    if [[ -e ${src}.old ]]; then
        cp ${src}.old $src
    fi
}

install_all() {
    install bashrc $bashrc
    install vimrc $vimrc
}

clean_all() {
    cleanup $bashrc
    cleanup $vimrc
}

fetch() {
    local tarball="https://github.com/104012/shell_configs/tarball/master"
    curl -L $tarball | tar pzx --strip=1
}

update() {
    fetch
    clean_all
    ./deploy.sh install
}

prompt() {
    while true; do
        read -p "$1" yn
        case $yn in
            [Yy]*) return 0;;
            [Nn]*) return 1;;
            *) echo "Yes or no?"
        esac
    done
}


main() {
    case "$1" in
        "install")
            prompt "This will move current *rc files to *rc.old. Continue? " \
                || exit 1
            install_all
            ;;
        "clean")
            clean_all
            ;;
        "fetch")
            fetch
            ;;
        "update")
            prompt "This will delete current *rc files. Continue? " \
                || exit 1
            clean_all
            install_all
            ;;
    esac
}

main "$@"
