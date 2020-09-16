#!/bin/bash

DO_SKIP_UNKNOWN=y

# Linux
LINUX_FILES=".bashrc  .gitconfig  .inputrc  .tmux.conf"

# Windows configuration
WINDOWS_HOME="/mnt/c/Users/Victor"
WINDOWS_TERM_FILES=".terminal  settings.json"

# Windows
WINDOWS_TERM_BASENAME=Microsoft.WindowsTerminal
WINDOWS_TERM_PATH=`ls -d $WINDOWS_HOME/AppData/Local/Packages/$WINDOWS_TERM_BASENAME*/LocalState 2> /dev/null`
if [[ -z $WINDOWS_TERM_PATH ]]; then
	echo "Cannot find 'Windows Terminal' installed"
	if [[ "$DO_SKIP_UNKNOWN" == y ]]; then
		echo Skipping
	else
		echo Exit
		exit
	fi
fi


function call {
	#echo "$@"
	"$@"
}

function do_copy {
	echo "Copying Linux .dotfiles"
	for f in $LINUX_FILES; do
		call cp -a $f ~/
	done

	echo
	echo "Copying Windows .dotfiles"
	for f in $WINDOWS_TERM_FILES; do
		call cp -a $f $WINDOWS_TERM_PATH/
	done
}

function do_diff {
	for f in $LINUX_FILES; do
		call diff -q $f ~/$f
	done

	for f in $WINDOWS_TERM_FILES; do
		call diff -q $f $WINDOWS_TERM_PATH/$f
	done
}

function do_list {
	for f in $LINUX_FILES; do
		echo "$f -> ~/$f"
	done

	echo "[WINDOWS_TERM = $WINDOWS_TERM_PATH]"
	for f in $WINDOWS_TERM_FILES; do
		echo "$f -> WINDOWS_TERM/$f"
	done
}


do_list
