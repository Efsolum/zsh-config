# -*- mode: sh; sh-shell: zsh;-*-

# start emacs servers
instances=('default' 'projects')
for inst in $instances
do
		if [ ! -e "/tmp/emacs$(id -u $USERNAME)/$inst" ]
		then
				print "starting emacs $inst server"
				emacs --daemon=$inst &> /dev/null &
		fi
done
