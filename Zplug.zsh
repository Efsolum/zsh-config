# -*- mode: sh; sh-shell: zsh;-*-

[[ -d $ZPLUG_HOME ]] || \
		{print 'Installing Zplug'
		 git clone https://github.com/b4b4r07/zplug $ZPLUG_HOME
		 zplug update --self}

source $ZPLUG_HOME/zplug

zplug "b4b4r07/zplug" # ZSH & CLI Package Manager
# zplug "zsh-users/zaw", of:zaw.zsh # Zsh anything.el-like widget.

# zplug "zakaziko99/agnosterzak-ohmyzsh-theme", of:agnosterzak.zsh-theme

zplug "caiogondim/bullet-train-oh-my-zsh-theme", of:bullet-train.zsh-theme
export BULLETTRAIN_CONTEXT_SHOW=true
export BULLETTRAIN_EXEC_TIME_SHOW=true

# zplug "Ciacho/ciacho-ohmyzsh-theme", of:ciacho.zsh-theme

# zplug "bhilburn/powerlevel9k", of:powerlevel9k.zsh-theme
# export POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# zplug "el1t/statusline", of:"oh-my-zsh/statusline.zsh-theme"

zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Vagrant completions
zplug "plugins/vagrant", from:oh-my-zsh

#  Simplistic interactive filtering tool
zplug "peco/peco", as:command, from:gh-r

# fzf is a general-purpose command-line fuzzy finder.
zplug "junegunn/fzf-bin", \
			as:command, of:"*linux*amd64*", from:gh-r, file:fzf

# Directory listings for zsh with git features
zplug "supercrabtree/k"

# Fish shell like syntax highlighting for Zsh.
zplug "zsh-users/zsh-syntax-highlighting"

# lightweight and flexible command-line JSON processor
zplug "stedolan/jq", as:command, from:gh-r, file:jq

# Local Scripts
zplug "$ZDOTDIR/scripts", from:local, as:command

# Local Applications
zplug "$DESKTOP_APPS/firefox-47.0a2.en-US.linux-x86_64", \
			from:local, as:command, of:firefox, file:firefox-dev, \
			if:"[[ -d \"$DESKTOP_APPS/firefox-47.0a2.en-US.linux-x86_64\" ]]"

zplug "$DESKTOP_APPS/skype-4.3.0.37", \
			from:local, as:command, of:skype, file:skype, \
			if:"[[ -d \"$DESKTOP_APPS/skype-4.3.0.37\" ]]"

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
