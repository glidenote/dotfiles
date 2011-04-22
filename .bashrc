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

# ログイン時にscreen 自動起動
if [ "$TERM" = 'xterm' -o "$TERM" = 'linux' ]; then
	screen -rx || screen -D -RR
fi


