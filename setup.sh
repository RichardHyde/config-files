#!/bin/bash

CURR_DIR=$(pwd)

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
		ln -s ${CURR_DIR}/${SRC} ${HOME}/${DEST}
	else
		ln ${CURR_DIR}/${SRC} ${HOME}/${DEST}
	fi
}

if [ ! -d ${HOME}/.config ]; then
	mkdir ~/.config
fi

mklink fish .config/fish

mklink .sqliterc

mklink .vimrc
mklink .vim

