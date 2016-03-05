# -*- mode: sh; sh-shell: zsh;-*-

export TERM=xterm-256color

# zplug directory, for storing zsh dpendencies
export ZPLUG_HOME=$ZDOTDIR/zplug

# Declare a user-wide stash
export GLOBAL_ENVSTORE_FILE=$HOME/.zconfig/userstash
export ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE

# Directory for GNU Stow
export STOW_DIR=$HOME/dotfiles/

# XDG Settings
# export XDG_CONFIG_HOME=
