
ZPLUG_INIT=$HOME/tools/share/zsh-user-customizations/zplug/init.zsh
[[ -f $ZPLUG_INIT ]] && \
		source $ZPLUG_INIT
unset ZPLUG_INIT

# ZSH_TMUX_INIT=$HOME/tools/share/zsh-user-customizations/zsh-tmux/init.zsh
# [[ -f $ZSH_TMUX_INIT ]] && \
# 		source $ZSH_TMUX_INIT
# unset ZSH_TMUX_INIT

ZSH_SETTINGS_INIT=$HOME/tools/share/zsh-user-customizations/zsh-settings/init.zsh
[[ -f $ZSH_SETTINGS_INIT ]] && \
		source $ZSH_SETTINGS_INIT
unset ZSH_SETTINGS_INIT

export DIR_STACK_SIZE=40
export DIR_STACK_FILE=$ZDOTDIR/stackhist

# Stash variables
[[ -z $TMUX ]] && \
		{ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE envstore clear
		 ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE envstore save ZDOTDIR
		 ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE envstore save PATH}

[[ -f $ZDOTDIR/functions/index ]] && \
		source $ZDOTDIR/functions/index
[[ -f $ZDOTDIR/settings/index.zsh ]] && \
		source $ZDOTDIR/settings/index.zsh

# prompt fire yellow red yellow

# restore the directory stack
dirstack restore

autoload -U add-zsh-hook
function on_exit_shell() {
		# save/persist the directory stack
		dirstack save
}
add-zsh-hook zshexit on_exit_shell

# This stays ad the bottom fo the file,
# and ensures there are no duplicates in $PATH/$path ...etc
typeset -U fpath path manpath infopath
