# -*- mode: sh; sh-shell: zsh;-*-
# Additional user tools go here.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export EDITOR="emacsclient -s projects -c"
export VISUAL=$EDITOR

#emacs cask
export PATH="$HOME/.cask/bin:$PATH"

#set up pyenv evironment
export PYENV_ROOT=/usr/local/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#set up rvm environment
# RVMSCRIPT="/usr/local/rvm/scripts/rvm"
# if [ -s $RVMSCRIPT ] ; then
#    source $RVMSCRIPT
# fi

# Check for external dependencies
command_list=(entr
							envstore
							symlinks)
for cmd in $command_list;
do
		type $cmd >& /dev/null
		[[ $? -ne 0 ]] && \
				print "Error: $cmd is not installed, please do so."
done

# Calibre settings
CALIBRE_TEMP_DIR=$HOME/temp/calibre
[[ -d $CALIBRE_TEMP_DIR ]] || mkdir -p $CALIBRE_TEMP_DIR
