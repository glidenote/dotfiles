export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

if [[ -f `command -v direnv` ]] ; then eval "$(direnv hook zsh)" ; fi

# for nvm
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

if [[ -f ~/bin/aws_zsh_completer.sh ]] ; then source ~/bin/aws_zsh_completer.sh; fi

# http://rcmdnk.github.io/blog/2014/11/22/computer-mac-homebrew/
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
