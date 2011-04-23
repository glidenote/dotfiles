# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# bash-completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# git-completion
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

# tscreenがあればそれを使う 
if [ -x /bin/tscreen ]; then
	alias screen='tscreen'
fi

# ログイン時に自動でscreenを起動するように。（多重screen禁止)
case "$TERM" in
    xterm*|linux*)
		screen -rx || screen -D -RR
        ;;
    screen*)
		zsh
        ;;
esac
