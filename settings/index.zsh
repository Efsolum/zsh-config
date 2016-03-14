# -*- mode: sh; sh-shell: zsh;-*-

settings_dir=$(dirname $_)

for set_file in $(ls $settings_dir) ;
do
		[[ $set_file == 'index.zsh' ]] && continue
    source $settings_dir/$set_file
done
