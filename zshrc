# -*- mode: sh; sh-shell: zsh;-*-

autoload -U promptinit; promptinit; prompt fire yellow red yellow
autoload -U zmv
autoload -U compinit; compinit

# Keybindings
bindkey -e # default to emacs keybindings
bindkey "^Hm" run-help # C-h m

setopt AUTO_PUSHD
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
setopt SHARE_HISTORY

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=$ZDOTDIR/history

# Stash $PATH
ENVSTORE_FILE=$GLOBAL_ENVSTORE_FILE envstore save PATH

[[ -f $ZDOTDIR/functions/index ]] && \
		source $ZDOTDIR/functions/index
[[ -f $ZDOTDIR/settings/index ]] && \
		source $ZDOTDIR/settings/index
[[ -f $ZDOTDIR/zplug_config ]] && \
		source $ZDOTDIR/zplug_config

# This stays ad the bottom fo the file,
# and ensures there are no duplicates in $PATH/$path
typeset -U PATH
