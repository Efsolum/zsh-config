# -*- mode: sh; sh-shell: zsh;-*-

[[ -d $ZPLUG_HOME ]] || \
		{print 'Installing Zplug'
		 git clone https://github.com/b4b4r07/zplug $ZPLUG_HOME
		 zplug update --self}

source $ZPLUG_HOME/zplug

zplug "b4b4r07/zplug" # ZSH & CLI Package Manager

zplug "caiogondim/bullet-train-oh-my-zsh-theme", of:bullet-train.zsh-theme
export BULLETTRAIN_CONTEXT_SHOW=true
export BULLETTRAIN_EXEC_TIME_SHOW=true

# zplug "zakaziko99/agnosterzak-ohmyzsh-theme", of:agnosterzak.zsh-theme

# zplug "Ciacho/ciacho-ohmyzsh-theme", of:ciacho.zsh-theme

# zplug "bhilburn/powerlevel9k", of:powerlevel9k.zsh-theme
# export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# zplug "el1t/statusline", of:"oh-my-zsh/statusline.zsh-theme"

zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "hlissner/zsh-autopair"

# apt-get install libnotify-bin xdotool
zplug "marzocchi/zsh-notify", if:"[[ -n $DISPLAY ]]"

# Vagrant completions
zplug "plugins/vagrant", from:oh-my-zsh

# Directory listings for zsh with git features
zplug "supercrabtree/k"

# Fish shell like syntax highlighting for Zsh.
zplug "zsh-users/zsh-syntax-highlighting"

# lightweight and flexible command-line JSON processor
zplug "stedolan/jq", as:command, from:gh-r, file:jq

# Install missing plugins
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to $PATH
zplug clear --force > /dev/null
zplug load

# update symlinks to relative paths
if [[ -d $ZDOTDIR/zplug/bin/ ]]; then
		symlinks -dc $ZDOTDIR/{zplug/bin/,zplug} | \
				sed 's\^\symlinks: \' &>> $ZCONFIG_LOG
fi
