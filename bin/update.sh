#!/bin/sh

# Bundle => NeoBundle
if [ ! -e  ~/.vim/bundle/neobundle.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
    perl -p -i -e 's/^Bundle/NeoBundle/g' ~/.vimrc.local
    vim +NeoBundleInstall! +qall
    vim +NeoBundleClean +qall
fi
