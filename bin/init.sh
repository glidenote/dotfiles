#!/bin/sh

# git clone git://github.com/glidenote/home_config.git 
# の後に流し、ホームディレクトリをgithubに置いてあるものに置き換える

cd ~

# 必要ディレクトリの作成
mkdir bin tmp src
mkdir ~/.zsh/
touch ~/.zsh/`hostname`.rc

# 既存ディレクトリ、ファイルを待避させる
if [ ! -e ~/old_files ]; then
	mkdir ~/old_files
	mv ~/bin ~/old_files 
	mv ~/.vim~ /old_files
	mv ~/.bash_profile ~/old_files
	mv ~/.bashrc ~/old_files 
	mv ~/.git ~/old_files 
	mv ~/git-completion.bash ~/old_files 
	mv ~/.gitconfig ~/old_files 
	mv ~/.gitignore ~/old_files
	mv ~/.gitmodules ~/old_files 
	mv ~/.screenrc ~/old_files 
	mv ~/.tscreenrc ~/old_files 
	mv ~/.vimrc ~/old_files  
	mv ~/.zshrc ~/old_files  
fi

# submodule
cd ~/home_config
git submodule init
git submodule update

# linkを貼る
ln -s ~/home_config/.vim ~/
ln -s ~/home_config/bin ~/
ln -s ~/home_config/.bash_profile ~/.bash_profile
ln -s ~/home_config/.git-completion.bash ~/.git-completion.bash
ln -s ~/home_config/.gitignore ~/.gitignore
ln -s ~/home_config/.screenrc ~/.screenrc
ln -s ~/home_config/.tscreenrc ~/.tscreenrc
ln -s ~/home_config/.vimrc ~/.vimrc
ln -s ~/home_config/.zshrc ~/.zshrc
ln -s ~/home_config/.bashrc ~/.bashrc

# ln -s ~/home_config/.gitconfig ~/.gitconfig
