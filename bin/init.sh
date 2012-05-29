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
.bashrc
.pryrc
bash_completion_tmux.sh
.tmux.conf
.zsh
"

# 必要ディレクトリの作成
cd ~
mkdir bin tmp src
touch ~/.zsh/`hostname`.zsh
touch ~/.vimrc.local

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
vim +BundleInstall! +q

# vimproc make task
cd ~/.vim/bundle/vimproc/.git/hooks/
wget https://raw.github.com/gist/1261116/b1fac4ff6ea192eb90d6744d21fc6fd482206bc9/post-merge
chmod 755 post-merge
./post-merge
