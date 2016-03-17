# -*- mode: sh; sh-shell: zsh;-*-
# Additional user tools go here.

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)

export EDITOR="emacsclient -s projects -t"
export VISUAL="emacsclient -s projects -c"

# Emacs Cask
[[ -d "$HOME/.cask" ]] || \
		curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
[[ -d "$HOME/.cask/bin" ]] && path=($HOME/.cask/bin $path)

#set up pyenv evironment
export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT ]] || \
		{curl -L \
					https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer |\
						bash}
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#set up rvm environment
# RVMSCRIPT="/usr/local/rvm/scripts/rvm"
# if [ -s $RVMSCRIPT ] ; then
#    source $RVMSCRIPT
# fi

# Check for external dependencies
command_list=(tmux
							entr
							envstore
							symlinks)
for cmd in $command_list;
do
		type $cmd >& /dev/null
		[[ $? -ne 0 ]] && \
				print "Error: $cmd is not installed, please do so."
done

# Calibre settings
CALIBRE_TEMP_DIR=$HOME/tmp/calibre
[[ -d $CALIBRE_TEMP_DIR ]] || mkdir -p $CALIBRE_TEMP_DIR
