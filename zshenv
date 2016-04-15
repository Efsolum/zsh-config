# -*- mode: sh; sh-shell: zsh;-*-

# Add these two lines to $HOME/.zshenv
# export ZDOTDIR=$HOME/.zconfig
# source $ZDOTDIR/.zshenv

# XDG related variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CONFIG_DIRS=
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_DATA_DIRS=
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR=

# Setup terminal for colors
if [[ -n $TMUX ]] ; then
		export TERM=screen-256color
else
		export TERM=xterm-256color
fi

# Declare a user-wide stashes
export GLOBAL_ENVSTORE_FILE=$ZDOTDIR/userstash
export ESSENTIAL_ENVSTORE_FILE=$ZDOTDIR/essentialstash
export ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE

# Directory for GNU Stow
export STOW_DIR=$HOME/dotfiles

# XDG Settings
# export XDG_CONFIG_HOME=

[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)

# $ mkdir -p tools/{bin,include,etc,lib,man,sbin,share,src,stow} tools/share/{man,info}
if [[ -d $HOME/tools ]]; then
		path=($HOME/tools/bin $HOME/tools/sbin $path)
		export PATH
		export MANPATH="$HOME/tools/man:$MANPATH"
		export INFOPATH="$HOME/tools/info:$INFOPATH"
fi

# zonfig log directory
export ZCONFIG_LOG_DIR=$ZDOTDIR/logs
export ZCONFIG_LOG=$ZCONFIG_LOG_DIR/zconfig-$(date +%G%m%d).log
[[ -d $ZCONFIG_LOG_DIR ]] || \
		mkdir $ZCONFIG_LOG_DIR

# zplug directory, for storing zsh dpendencies
export ZPLUG_HOME=$ZDOTDIR/zplug

# Application directories
export DESKTOP_APPS=$ZDOTDIR/desktop_apps
export CLI_APPS=$ZDOTDIR/cli_apps

[[ -d $DESKTOP_APPS ]] || mkdir -p $DESKTOP_APPS
[[ -d $CLI_APPS ]] || mkdir -p $CLI_APPS

# Python Pyenv
export PYENV_ROOT=$CLI_APPS/pyenv
