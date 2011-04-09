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
