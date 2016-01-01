#=============================
# LANG
#=============================
export LANG=en_US.UTF-8
#export TERM=xterm
bindkey -e

#=============================
# source OSTYPE file
#=============================
case "${OSTYPE}" in
  darwin*)
    source ~/.zsh.d/mac.zsh
    ;;
esac

#=============================
# terminal
#=============================
stty stop undef

#=============================
# zcompile
#=============================
zcompile ~/.zshrc

#=============================
# path
#=============================
PATH=$PATH:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin
export PATH
export MANPATH=/opt/local/man:/usr/share/man:$MANPATH
export LESS='-R'
export GOPATH=$HOME
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#=============================
# fpath (zsh completion)
#=============================

fpath=(~/.zsh.d/zsh-completions/src ~/.zsh.d/custom-completions $fpath)

#=============================
# set prompt
#=============================
autoload colors
colors

#=============================
# antigen and prompt
#=============================
if [[ -e ~/.zsh.d/antigen.zsh ]] ; then
    source ~/.zsh.d/antigen.zsh;
  else
    # antigenが無ければ昔のpromptを使う
    source ~/.zsh.d/prompt.zsh;
fi

#=============================
# terminal title
#=============================
case "${TERM}" in
  kterm*|xterm*)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


#=============================
# history
#=============================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt extended_history
function history-all { history -E 1 }
setopt hist_ignore_all_dups
setopt hist_ignore_space

#=============================
# Search History
#=============================
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#=============================
# setopt
#=============================
autoload -U compinit #補完機能
compinit -u

# autoload -U predict-on # 先方予測機能
# predict-on

setopt auto_cd
setopt auto_pushd

# --prefix=~/localというように「=」の後でも
#「~」や「=コマンド」などのファイル名展開を行う。
setopt magic_equal_subst

setopt correct           # コマンド自動修正
setopt list_packed       # 補完候補を詰めて表示
setopt nolistbeep        # 補完表示時にビープ音を鳴らさない
setopt complete_aliases  # エイリアスを設定したコマンドでも補完機能を使えるようにする
setopt transient_rprompt # コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt long_list_jobs    # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt list_types        # 補完候補一覧でファイルの種別をマーク表示
setopt complete_in_word  # カーソル位置で補完する。
setopt glob_complete     # globを展開しないで候補の一覧から補完する。
setopt hist_expand       # 補完時にヒストリを自動的に展開する。
setopt no_beep           # 補完候補がないときなどにビープ音を鳴らさない。
setopt numeric_glob_sort # 辞書順ではなく数字順に並べる。
setopt rm_star_wait      # rm * を実行する前に確認
setopt hist_no_store     # history コマンドを history に保存しない
setopt mark_dirs         # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt no_flow_control   # disable C-q, C-s
setopt auto_param_slash  # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt brace_ccl         # {a-c} を a b c に展開する機能を使えるようにする

#=============================
# zstyle
#=============================

#  補完のグループ化
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2                # 補完メニューの表示
zstyle ':completion:*:default' list-colors ""               # 補完候補の色分け
zstyle ':completion:*' use-cache true                       # 補完候補をキャッシュする。
zstyle ':completion:*' verbose yes                          # 詳細な情報を使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH" # sudo時にはsudo用のパスも使う。
zstyle ':vcs_info:*' enable git # svn hg bzr                # git以外ではvcs_infoを利用しない

#=============================
# misc
#=============================

# 実行したプロセスの消費時間が3秒以上かかったら
# 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

chpwd_functions=($chpwd_functions dirs) # ディレクトリが変わったらディレクトリスタックを表示。
WORDCHARS=${WORDCHARS:s,/,,}            # 「/」も単語区切りとみなす。

#=============================
# alias
#=============================
alias v='vim'
alias vi='vim'
alias eh='vim /etc/hosts'
alias g='git'
alias cp='cp -i'
alias mv='mv -i'
# alias h='history 25'
# alias j='jobs -l'
alias grep='grep --color=auto'
# alias sudo='sudo -E '

# OSによる切り替えを行う
alias where="command -v"

# ls
case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
  linux*)
    alias ls="ls --color"
    alias dstat-full='dstat -Tclmdrn'
    alias dstat-mem='dstat -Tclm'
    alias dstat-cpu='dstat -Tclr'
    alias dstat-net='dstat -Tclnd'
    alias dstat-disk='dstat -Tcldr'
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias tmux="tmux -2"
alias ta='tmux a -d || tmux -f ~/.tmux.conf'

if [[ -f `command -v hub` ]] ; then alias git=hub ; fi
if [[ -f `command -v pry` ]] ; then alias p=pry ; fi

alias gst='git status -sb'
alias zcompdump_rebuild='rm -f ~/.zcompdump; compinit'

#=============================
# SSH + TMUX
#=============================
if [ -n "$TMUX" ];then
  function ssh_tmux(){
    eval server=\${$#}
    eval tmux new-window -n "'${server}'" "'ssh $@'"
  }

  function mosh_tmux() {
    tmux new-window -n $@ "exec mosh $@"
  }

  alias ssh=ssh_tmux
  alias mosh=mosh_tmux
fi

#=============================
# use cdd on tmux
#=============================
# http://m4i.hatenablog.com/entry/2012/01/26/064329
. ~/bin/cdd
chpwd() {
  _cdd_chpwd
}

#=============================
# source zsh
#=============================
if [ -f ~/.zsh.d/`hostname`.zsh ]; then
  source ~/.zsh.d/`hostname`.zsh
fi

#=============================
# source private zsh
#=============================
if [ -f ~/.zsh.d/private.zsh ]; then
  source ~/.zsh.d/private.zsh
fi

#=============================
# source autojump.zsh
#=============================
if [ -f ~/.zsh.d/autojump.zsh ]; then
  source ~/.zsh.d/autojump.zsh
fi

#=============================
# source bd.zsh
#=============================
if [ -f ~/.zsh.d/bd.zsh ]; then
  source ~/.zsh.d/bd.zsh
fi

#=============================
# for peco
#=============================
if [[ -f `command -v peco` ]] ; then
  source ~/.zsh.d/peco.zsh
  alias peco='peco --rcfile=~/.config/peco/config.json'
fi

#=============================
# sudo.vim   http://blog.monoweb.info/article/2011120320.html
#=============================
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}


#=============================
# sheet
#=============================
if [[ -f `command -v sheet` ]] ; then
  compdef _sheets sheet
  function _sheets {
    local -a cmds
    _files -W  ~/.sheets/ -P '~/.sheets/'

    cmds=('list' 'edit' 'copy')
    _describe -t commands "subcommand" cmds

    return 1;
  }
fi

#=============================
# mosh completion
#=============================
compdef mosh=ssh

# The next line enables zsh completion for gcloud.
if [[ -f ~/google-cloud-sdk/completion.bash.inc ]] ; then
  source '/Users/glidenote/google-cloud-sdk/completion.zsh.inc'
  export PATH=/Users/glidenote/google-cloud-sdk/bin:$PATH
fi

#=============================
# ssh-agent http://blog.manaten.net/entry/ssh-agent-forward
#=============================
SSH_AGENT_FILE="$HOME/.ssh-agent-info"
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
if ! ssh-add -l >& /dev/null ; then
  ssh-agent > $SSH_AGENT_FILE
  source $SSH_AGENT_FILE
  ssh-add
fi

AGENT_SOCK_FILE="/tmp/ssh-agent-$USER"
SSH_AGENT_FILE="$HOME/.ssh-agent-info"
if test $SSH_AUTH_SOCK ; then
  if [ $SSH_AUTH_SOCK != $AGENT_SOCK_FILE ] ; then
    ln -sf $SSH_AUTH_SOCK $AGENT_SOCK_FILE
    export SSH_AUTH_SOCK=$AGENT_SOCK_FILE
  fi
else
  test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
  if ! ssh-add -l >& /dev/null ; then
    ssh-agent > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE
    ssh-add
  fi
fi

#=============================
# any-frame http://qiita.com/mollifier/items/81b18c012d7841ab33c3
#=============================

zstyle ":anyframe:selector:" use peco
zstyle ":anyframe:selector:peco:" command 'peco --layout=bottom-up'
bindkey '^r' anyframe-widget-execute-history

bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history


bindkey '^s' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
