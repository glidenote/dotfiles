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
.gitconfig
.screenrc
.tscreenrc
.vimrc
.zshrc
.zshenv
.bashrc
.pryrc
.gemrc
bash_completion_tmux.sh
.tmux.conf
.zsh
"

# 必要ディレクトリの作成
cd ~
mkdir bin tmp src .tmux
touch ~/.zsh/`hostname`.zsh
touch ~/.vimrc.local
touch ~/.gitconfig.local

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
    rm -rf ~/${FILE}
    ln -s ~/dotfiles/${FILE} ~/${FILE}
done

# git submodule init & update
cd ~/dotfiles
git submodule init
git submodule update

# Bundleinstall 
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +qall

# vimproc make task
cd ~/.vim/bundle/vimproc/.git/hooks/
wget https://gist.github.com/glidenote/2823168/raw/55efc9c72bd9bda4ea6a6af3a37daf253957753f/post-merge
chmod 755 post-merge
./post-merge
