#!/bin/sh

# git clone git://github.com/glidenote/home_config.git 
# の後に流し、ホームディレクトリをgithubに置いてあるものに置き換える

cd ~

# 必要ディレクトリの作成
mkdir bin tmp src
mkdir ~/.zsh/
touch ~/.zsh/`hostname`.rc

# 既存ディレクトリ、ファイルの削除
/bin/rm -rf ~/bin
/bin/rm -rf ~/.vim
/bin/rm -rf ~/.bash_profile
/bin/rm -rf ~/.bashrc
/bin/rm -rf ~/.git
/bin/rm -rf ~/.git-completion.bash
/bin/rm -rf ~/.gitconfig
/bin/rm -rf ~/.gitignore
/bin/rm -rf ~/.gitmodules
/bin/rm -rf ~/.screenrc
/bin/rm -rf ~/.vimrc
/bin/rm -rf ~/.zshrc

# submodule
cd ~/home_config
git submodule init
git submodule update

# linkを貼る
ln -s ~/home_config/.bash_profile ~/.bash_profile
ln -s ~/home_config/bin ~/bin
ln -s ~/home_config/.vim ~/.vim
ln -s ~/home_config/.git-completion.bash ~/.git-completion.bash
ln -s ~/home_config/.gitignore ~/.gitignore
ln -s ~/home_config/.screenrc ~/.screenrc
ln -s ~/home_config/.vimrc ~/.vimrc
ln -s ~/home_config/.zshrc ~/.zshrc
ln -s ~/home_config/.bashrc ~/.bashrc

# ln -s ~/home_config/.gitconfig ~/.gitconfig
