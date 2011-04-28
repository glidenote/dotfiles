#!/bin/sh

# git clone git://github.com/glidenote/dotfiles.git 
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
	mv ~/.tmux.conf ~/old_files  
fi

# submodule
cd ~/dotfiles
git submodule init
git submodule update

# linkを貼りなおし
/bin/rm -rf ~/.vim
/bin/rm -rf ~/bin
/bin/rm -rf ~/.bash_profile
/bin/rm -rf ~/.git-completion.bash
/bin/rm -rf ~/bash_completion_tmux.sh
/bin/rm -rf ~/.gitignore
/bin/rm -rf ~/.screenrc
/bin/rm -rf ~/.tscreenrc
/bin/rm -rf ~/.vimrc
/bin/rm -rf ~/.zshrc
/bin/rm -rf ~/.bashrc
/bin/rm -rf ~/bash_completion_tmux.sh
/bin/rm -rf ~/.tmux.conf

ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/bin ~/
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.git-completion.bash ~/.git-completion.bash
ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/.screenrc ~/.screenrc
ln -s ~/dotfiles/.tscreenrc ~/.tscreenrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/bash_completion_tmux.sh ~/bash_completion_tmux.sh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# ln -s ~/dotfiles/.gitconfig ~/.gitconfig
