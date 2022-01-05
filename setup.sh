#!/bin/bash

CURR_DIR=$(pwd)

install_package() {
    PKGNAME="$1"
    case $(uname -s) in
        Linux*) 
            PKGMGR="sudo apt install"
            ;;
        Darwin*) 
            if [ ! -z "$2" ]; then
                PKGNAME="$2"
            fi
            PKGMGR="brew install"
            ;;
        *) return;;
    esac

    $PKGMGR "$PKGNAME"
}

mklink() {
	SRC=$1
	
	if [ -z "$2" ]; then
		DEST=$1
	else
		DEST=$2
	fi

	if [ -h ${HOME}/${DEST} -o ${HOME}/${DEST} -ef ${CURR_DIR}/${SRC} ]; then
		return 0
	fi

	if [ -d ${CURR_DIR}/${SRC} ]; then
		ln -s ${CURR_DIR}/${SRC} ${HOME}/.config
	else
		ln ${CURR_DIR}/${SRC} ${HOME}/${DEST}
	fi
}

if [ ! -d ${HOME}/.config ]; then
	mkdir ~/.config
fi

if which fish > /dev/null; then
    mklink fish .config/fish
else
    echo Skipping fish, not installed
fi

mklink .sqliterc

mklink .vimrc
mklink vim 

mklink .screenrc

if which zsh > /dev/null; then
    mklink zsh .config/zsh
    mklink zsh/.zshenv .zshenv

    if [ ! -d ${HOME}/.config/oh-my-zsh ]; then
        install_package fonts-powerline

        ZSH=${HOME}/.config/oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        rm -fr ${HOME}/.config/oh-my-zsh/custom
        mklink oh-my-zsh/custom .config/oh-my-zsh/custom
    fi
else
    echo Skipping zsh, not installed
fi

