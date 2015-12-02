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

# bash_completion_tmux.sh 
if [ -f ~/bash_completion_tmux.sh ]; then
    source ~/bash_completion_tmux.sh 
fi

# tscreenがあればそれを使う 
if [ -x /bin/tscreen ]; then
    alias screen='tscreen'
fi

# tmuxを256色に
alias tmux='tmux -2'
alias ta='tmux attach || tmux -f ~/.tmux.conf'

#  # ログイン時に自動でscreenを起動するように。（多重screen禁止)
#  case "$TERM" in
#      xterm*|linux*)
#       screen -rx || screen -D -RR
#          ;;
#      screen*)
#       zsh
#          ;;
#  esac

#=============================
# source zsh
#=============================
if [ -f ~/.zsh/`hostname`.rc ]; then
    source ~/.zsh/`hostname`.rc
fi
