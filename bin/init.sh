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
.gitconfig.mac
.screenrc
.tscreenrc
.vimrc
.vimrc.mac
.zshrc
.zshenv
.bashrc
.pryrc
.gemrc
bash_completion_tmux.sh
.tmux.conf
.zsh.d
.config
.tigrc
"

# 必要ディレクトリの作成
cd ~
mkdir bin tmp src .tmux
touch ~/.zsh.d/`hostname`.zsh
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

# install peco and ghq
export GOPATH=$HOME
go get github.com/peco/peco/cmd/peco
go get github.com/motemen/ghq

# git submodule init & update
cd ~/dotfiles
git submodule init
git submodule update

# vim-plug
mkdir -p ~/.vim/plugged/vim-plug
git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload

