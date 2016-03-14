# -*- mode: sh; sh-shell: zsh;-*-

if [[ -n $TMUX ]] ; then
		export TERM=screen-256color
else
		export TERM=xterm-256color
fi

# zplug directory, for storing zsh dpendencies
export ZPLUG_HOME=$ZDOTDIR/zplug

# Declare a user-wide stash
export GLOBAL_ENVSTORE_FILE=$HOME/.zconfig/userstash
export ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE

# Directory for GNU Stow
export STOW_DIR=$HOME/dotfiles

# XDG Settings
# export XDG_CONFIG_HOME=

# zonfig log directory
export ZCONFIG_LOG_DIR=$ZDOTDIR/logs
export ZCONFIG_LOG=$ZCONFIG_LOG_DIR/zconfig-$(date +%G%m%d).log
[[ -d $ZCONFIG_LOG_DIR ]] || \
		mkdir $ZCONFIG_LOG_DIR
