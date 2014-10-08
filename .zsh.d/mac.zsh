export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

if [[ -f `command -v direnv` ]] ; then eval "$(direnv hook zsh)" ; fi

# for nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

if [[ -f ~/bin/aws_zsh_completer.sh ]] ; then source ~/bin/aws_zsh_completer.sh; fi

if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# perl
export PERL_LOCAL_LIB_ROOT="/Users/`whoami`/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/`whoami`/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/`whoami`/perl5";
export PERL5LIB="/Users/`whoami`/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/`whoami`/perl5/bin:$PATH";
