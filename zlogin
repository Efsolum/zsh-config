# -*- mode: sh; sh-shell: zsh;-*-

typeset -A inprogress
instances=('default' 'projects')

# start emacs servers
for inst in $instances
do
		inprogress[$inst]=$(pgrep -la emacs | grep daemon | grep $inst)
		if [ ! -e "/tmp/emacs$(id -u $USERNAME)/$inst" ] && \
					 [ -z $inprogress[$inst] ]
		then
				print "starting emacs $inst server"
				emacs --daemon=$inst &> /dev/null &
		fi
done
