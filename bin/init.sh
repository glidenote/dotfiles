#!/bin/sh

# git clone git://github.com/glidenote/dotfiles.git 
# の後に流し、ホームディレクトリをgithubに置いてあるものに置き換える

# gitで管理するファイルリスト
FILELIST="
.vim
bin
.bash_profile
.git-completion.bash
bash_completion_tmux.sh
.gitignore
.screenrc
.tscreenrc
.vimrc
.zshrc
.bashrc
bash_completion_tmux.sh
.tmux.conf
"

# 必要ディレクトリの作成
cd ~
mkdir bin tmp src
mkdir ~/.zsh/
touch ~/.zsh/`hostname`.rc

# 既存ディレクトリ、ファイルを待避させる
if [ ! -e ~/old_files ]; then
	mkdir ~/old_files
	for FILE in ${FILELIST};
	do
		mv ~/${FILE} ~/old_files/
	done
fi

# link張り直し
for FILE in ${FILELIST};
do
	/bin/rm -rf ~/${FILE}
	ln -s ~/dotfiles/${FILE} ~/${FILE}
done

# git submodule init & update
cd ~/dotfiles
git submodule init
git submodule update

