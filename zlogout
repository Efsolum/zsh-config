
# cleanup older log files
[[ -d $ZCONFIG_LOG_DIR ]] && \
		{print "cleaning up $ZCONFIG_LOG_DIR"
		 find $ZCONFIG_LOG_DIR/* -type f -ctime +4 -delete -print0}

# save/persist the directory stack
dirstack save
