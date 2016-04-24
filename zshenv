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

# Declare a user-wide stashes
export GLOBAL_ENVSTORE_FILE=$ZDOTDIR/userstash
export ESSENTIAL_ENVSTORE_FILE=$ZDOTDIR/essentialstash
export ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE

# Directory for GNU Stow
# export STOW_DIR=$HOME/dotfiles

# XDG Settings
# export XDG_CONFIG_HOME=

[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)

# zonfig log directory
export ZCONFIG_LOG_DIR=$ZDOTDIR/logs
export ZCONFIG_LOG=$ZCONFIG_LOG_DIR/zconfig-$(date +%G%m%d).log
[[ -d $ZCONFIG_LOG_DIR ]] || \
		mkdir $ZCONFIG_LOG_DIR

ZSH_SETTINGS_INIT=$HOME/tools/share/zsh-user-customizations/zsh-settings/initenv.zsh
[[ -f $ZSH_SETTINGS_INIT ]] && \
		source $ZSH_SETTINGS_INIT
unset ZSH_SETTINGS_INIT
