# -*- mode: sh; sh-shell: zsh;-*-
# Additional user tools go here.

# gnupg & gnupg2 config & data directory
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Git config file path
export GIT_CONFIG=$XDG_CONFIG_HOME/gitconfig

# Emacs Cask
[[ -d "$HOME/.cask" ]] || \
		curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
[[ -d "$HOME/.cask/bin" ]] && path=($HOME/.cask/bin $path)

# Unison File Synchronizer config directory
export UNISON=$XDG_CONFIG_HOME/unison
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant

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
