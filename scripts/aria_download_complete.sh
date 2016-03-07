#!/usr/bin/env zsh

# Order of the expect arguments from aria2
# $1: GID, $2: Number of files, $3: Absolute path to first file

# option to add to user config
# on-download-complete=bin/aria_download_complete.sh

user_prefix=`basename "$0"`
output_dir=$HOME/Downloads/complete/

if [[ $2 -eq 0 ]]
then
		print "\n$user_prefix: No files to process"
elif [[ $2 -eq 1 ]]
then
		print "\n$user_prefix: Moving completed download: $3"
		mv --verbose "$3" $output_dir
else
		dir_path=$(dirname "$3" | awk -F / '{print $1"/"$2"/"$3}')
		print "\n$user_prefix: Moving completed downloads: $dir_path"
		mv --verbose "$dir_path" $output_dir
fi

print "$user_prefix: Arguments, GID: $1, Number of files: $2, File path: $3"
