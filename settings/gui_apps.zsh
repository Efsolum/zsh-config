
# Gstreamer Plugin path
# export GST_PLUGIN_SYSTEM_PATH="$XDG_DATA_HOME/gstreamer-0.10:/usr/lib/gstreamer-0.10"

# Calibre settings
export CALIBRE_CONFIG_DIRECTORY=$XDG_CONFIG_HOME/calibre
export CALIBRE_TEMP_DIR=$XDG_CACHE_HOME/calibre
export CALIBRE_CACHE_DIRECTORY=$XDG_DATA_HOME/calibre

# [[ -d $CALIBRE_TEMP_DIR ]] || \
# 		mkdir -p $CALIBRE_TEMP_DIR

# Audacity config directory
export AUDACITY_PATH=$XDG_DATA_HOME/audacity-data

export LYX_USERDIR_21x=$XDG_CONFIG_HOME/lyx
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer

# GIMP environment variables
# mkdir -p $GIMP2_DATADIR/menus
# rsync -av /usr/share/gimp/2.0/menus/ $GIMP2_DATADIR/menus/
export GIMP2_DIRECTORY=$XDG_CONFIG_HOME/gimp2
export GIMP2_DATADIR=$XDG_DATA_HOME/gimp2
