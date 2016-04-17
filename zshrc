# -*- mode: sh; sh-shell: zsh;-*-
[[ -f $ZDOTDIR/Zplug.zsh ]] && \
		source $ZDOTDIR/Zplug.zsh

autoload -U zmv
autoload -U compinit; compinit
autoload -U promptinit; promptinit

# Keybindings
bindkey -e # default to emacs keybindings
bindkey "^Hm" run-help # C-h m
bindkey "^W" kill-region # C-w

setopt AUTO_PUSHD
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt SHARE_HISTORY
unsetopt AUTO_CD
unsetopt PUSHD_MINUS

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZDOTDIR/history
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

# Start tmux session using default layout
sessionup=$(tmux list-sessions | grep General:)
if [[ -z $TMUX ]] && [[ -z $sessionup ]]; then
		tmux_default_layout
fi

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
# and ensures there are no duplicates in $PATH/$path
typeset -U PATH MANPATH INFOPATH
