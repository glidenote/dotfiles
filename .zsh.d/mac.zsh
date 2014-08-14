export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

if [[ -f `command -v direnv` ]] ; then eval "$(direnv hook zsh)" ; fi

#=============================
# antigen
#=============================
if [[ -e ~/.zsh.d/antigen.zsh ]] ; then source ~/.zsh.d/antigen.zsh ; fi
