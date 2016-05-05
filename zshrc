RPROMPT=''
ZLE_RPROMPT_INDENT=0

GUIX_SEC_BKG_COLOR=yellow
GUIX_SEC_FOR_COLOR=232
SUBSHELL_SEC_BKG_COLOR=blue
SUBSHELL_SEC_FOR_COLOR=232

if [[ -n $GUIX_ENVIRONMENT && $GUIX_ENVIRONMENT == 't' ]]; then
		RPROMPT+="%F{$GUIX_SEC_BKG_COLOR}$(print '\uE0B2')%f%K{$GUIX_SEC_BKG_COLOR}\
%F{$GUIX_SEC_FOR_COLOR} $(print '\u2622') Guix Env %f%k"
		RPROMPT+="%K{$GUIX_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_BKG_COLOR}$(print '\uE0B2')%f%k"
else
		RPROMPT+="%K{default}%F{$SUBSHELL_SEC_BKG_COLOR}$(print '\uE0B2')%f%k"
fi

if [[ $SHLVL == 1 ]]; then
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} Login %f%k"
elif [[ $SHLVL == 2 && -n $TMUX ]]; then
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} Tmux %f%k"
else
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} \
SHLVL: $SHLVL %f%k"
fi

ZPLUG_INIT=$HOME/tools/share/zsh-user-customizations/zplug/init.zsh
export USER_THEMES_ENABLED=true
[[ -f $ZPLUG_INIT ]] && \
		source $ZPLUG_INIT
unset ZPLUG_INIT

# ZSH_TMUX_INIT=$HOME/tools/share/zsh-user-customizations/zsh-tmux/init.zsh
# [[ -f $ZSH_TMUX_INIT ]] && \
#		source $ZSH_TMUX_INIT
# unset ZSH_TMUX_INIT

ZSH_SETTINGS_INIT=$HOME/tools/share/zsh-user-customizations/zsh-settings/init.zsh
[[ -f $ZSH_SETTINGS_INIT ]] && \
		source $ZSH_SETTINGS_INIT
unset ZSH_SETTINGS_INIT

export DIR_STACK_SIZE=40
export DIR_STACK_FILE=$ZDOTDIR/stackhist

# Stash variables
[[ -z $TMUX && -x $(type envstore) ]] && \
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
