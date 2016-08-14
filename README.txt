To use this config, add the following to you ~/.zshenv file;

# load /etc/profile
if [[ -f /etc/profile && ! -x $(type pwd) ]]; then
		emulate sh
		source /etc/profile
		emulate zsh
fi

export ZDOTDIR=$HOME/.zconfig
source $ZDOTDIR/.zshenv
