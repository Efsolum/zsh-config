#!/usr/bin/env zsh

function emacs_update_deps(){
		cask upgrade-cask
		cd ~/.emacs.d/
		cask update
		cd ~/
}

function emacs_shutdown_servers(){
		emacsclient -s default -e '(kill-emacs)'
		emacsclient -s projects -e '(kill-emacs)'
}
