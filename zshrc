RPROMPT=''
ZLE_RPROMPT_INDENT=0

SEC_SEPERATOR_ICON=$(print '\uE0B2')
GUIX_SEC_ICON=$(print '\u2622')
SUBSHELL_SEC_ICON_1=$(print '\u21AF')
SUBSHELL_SEC_ICON_2=$(print '\u262F')
SUBSHELL_SEC_ICON_3=$(print '\u264B')

GUIX_SEC_BKG_COLOR=yellow
GUIX_SEC_FOR_COLOR=232
SUBSHELL_SEC_BKG_COLOR=blue
SUBSHELL_SEC_FOR_COLOR=232

if [[ -n $GUIX_ENVIRONMENT && $GUIX_ENVIRONMENT == 't' ]]; then
		RPROMPT+="%F{$GUIX_SEC_BKG_COLOR}$SEC_SEPERATOR_ICON%f%K{$GUIX_SEC_BKG_COLOR}\
%F{$GUIX_SEC_FOR_COLOR} $GUIX_SEC_ICON Guix Env %f%k"
		RPROMPT+="%K{$GUIX_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_BKG_COLOR}$SEC_SEPERATOR_ICON%f%k"
else
		RPROMPT+="%K{default}%F{$SUBSHELL_SEC_BKG_COLOR}$SEC_SEPERATOR_ICON%f%k"
fi

if [[ $SHLVL == 1 ]]; then
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} \
$SUBSHELL_SEC_ICON_2"
		if [[ -o LOGIN ]]; then
				RPROMPT+=" Login "
		else
				RPROMPT+=" Non-login "
		fi
		RPROMPT+="%f%k"
elif [[ $SHLVL == 2 && -n $TMUX ]]; then
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} \
$SUBSHELL_SEC_ICON_3 Tmux %f%k"
else
		RPROMPT+="%K{$SUBSHELL_SEC_BKG_COLOR}%F{$SUBSHELL_SEC_FOR_COLOR} \
$SUBSHELL_SEC_ICON_1 SHLVL: $SHLVL %f%k"
fi

ZPLUG_INIT=$HOME/tools/share/zsh-user-customizations/zplug/init.zsh
export USER_THEMES_ENABLED=true
[[ -f $ZPLUG_INIT ]] && \
		source $ZPLUG_INIT
unset ZPLUG_INIT

ZSH_TMUX_INIT=$HOME/tools/share/zsh-user-customizations/zsh-tmux/init.zsh
[[ -f $ZSH_TMUX_INIT ]] && \
	source $ZSH_TMUX_INIT
unset ZSH_TMUX_INIT

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
