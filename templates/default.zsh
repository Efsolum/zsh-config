# Default template for new project structure

mkdir -p $PROJECT_ROOT/{design,notes,platform,src,staging,zproject}
mkdir $PROJECT_ROOT/zproject/functions/
mkdir $PROJECT_ROOT/platform/logs/

touch $PROJECT_ROOT/.projectile
touch $PROJECT_ROOT/zproject/{zshenv,zshrc,zlogin,zlogout}

local tfile
tfile=('zshenv' 'zshrc' 'zlogin' 'zlogout')
for target in $tfile; do
		ln --symbolic --relative \
			 $PROJECT_ROOT/zproject/$target $PROJECT_ROOT/zproject/.$target
done

local dirs
dirs=('zproject' 'platform' 'notes' 'design')
for dir in $dirs; do
		git init $PROJECT_ROOT/$dir
done
