#=============================
# LANG
#=============================
export LANG=en_US.UTF-8
#export TERM=xterm
bindkey -e

#=============================
# terminal
#=============================
stty stop undef

#=============================
# path
#=============================
PATH=$PATH:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin/
export PATH
export MANPATH=/opt/local/man:/usr/share/man:$MANPATH
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"
export EDITOR=vim
export LESS='-R'


#=============================
# fpath (zsh completion)
#=============================

fpath=(~/.zsh/zsh-completions $fpath)

#=============================
# set prompt
#=============================
autoload colors
colors

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    #----------
    # http://d.hatena.ne.jp/uasi/20091025/1256458798
    #----------
    autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

    function rprompt-git-current-branch {
    local name st color gitdir action
    if [[ "$PWD" == '/\.git(/.*)?$' ]]; then
        return
    fi
    name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
    if [[ -z $name ]]; then
        return
    fi

    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=%F{green}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=%B%F{red}
    else
        color=%F{red}
    fi

    echo "$color$name$action%f%b"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
RPROMPT='%{${fg[cyan]}%}[`rprompt-git-current-branch`%{${fg[cyan]}%}][%~]%{${reset_color}%}'
#---------
else
    RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
fi

PROMPT="%{${fg[cyan]}%}[%n@%m]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

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
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt extended_history
function history-all { history -E 1 }

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
compinit

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
alias vi='vim'
alias cp='cp -i'
alias mv='mv -i'
alias h='history 25'
# alias j='jobs -l'
alias grep='grep --color=auto'
# alias sudo='sudo -E '

# tscreen
if [ -x /bin/tscreen ]; then
    alias screen='tscreen'
fi

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
    solaris*)
        alias ls='gls -F --color=auto ' 
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias tmux="tmux -2"
alias ta='tmux attach || tmux -f ~/.tmux.conf'

#=============================
# SSH
#=============================

# HOSTNAMEによって切り替えを行う
# screenとtmuxの判別も行う http://genzou.ath.cx/
case "${HOSTNAME}" in
    manage*.jp)
        function ssh_screen(){
        eval server=\${$#}
        screen -t $server sudo ssh "$@"
    }
    function ssh_tmux(){
    eval server=\${$#}
    eval tmux new-window -n "'${server}'" "'sudo ssh $@'"
}
;;

    *)
        function ssh_screen(){
        eval server=\${$#}
        screen -t $server ssh "$@"
    }
    function ssh_tmux(){
    eval server=\${$#}
    eval tmux new-window -n "'${server}'" "'ssh $@'"
}
;;
esac

if [ x$TERM = xscreen ]; then
    if [ -e $TMUX ]; then
        alias ssh=ssh_screen
    else
        alias ssh=ssh_tmux
    fi
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
if [ -f ~/.zsh/`hostname`.rc ]; then
    source ~/.zsh/`hostname`.rc
fi

#=============================
# source z
#=============================
if [ -f ~/.zsh/z.sh ]; then
    _Z_CMD=z
    source ~/.zsh/z.sh
    precmd() {
      _z --add "$(pwd -P)"
    }
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
