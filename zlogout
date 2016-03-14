# -*- mode: sh; sh-shell: zsh;-*-

# cleanup older log files
[[ -d $ZCONFIG_LOG_DIR ]] || \
		find $ZCONFIG_LOG_DIR -type f -ctime +4 -delete -print0
