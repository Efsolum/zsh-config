# Default template for new project structure

mkdir -p $PROJECT_ROOT/{notes,src,zproject}
mkdir $PROJECT_ROOT/zproject/functions/

touch $PROJECT_ROOT/.projectile
touch $PROJECT_ROOT/zproject/{zshenv,zshrc,zlogin,zlogout}
touch $PROJECT_ROOT/notes/project.org

local tfile
tfile=('zshenv' 'zshrc' 'zlogin' 'zlogout')
for target in $tfile; do
		ln --symbolic --relative \
			 $PROJECT_ROOT/zproject/$target $PROJECT_ROOT/zproject/.$target
done

local dirs
dirs=('zproject' 'notes', 'src')
for dir in $dirs; do
		git init $PROJECT_ROOT/$dir
done
