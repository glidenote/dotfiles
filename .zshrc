#=============================
# LANG
#=============================
export LANG=en_US.UTF-8
#export TERM=xterm
bindkey -e


#=============================
# path
#=============================
PATH=$PATH:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin/
export PATH
export MANPATH=/opt/local/man:$MANPATH
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"

#=============================
# set prompt
#=============================
autoload colors
colors
PROMPT="%{${fg[blue]}%}[%n@%m]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

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
zstyle ':completion:*' list-colors ''

setopt correct #コマンド自動修正
setopt list_packed #補完候補を詰めて表示
setopt nolistbeep #補完表示時にビープ音を鳴らさない

#autoload predict-on #先方予測機能
#predict-on

setopt auto_cd
setopt auto_pushd

#=============================
# Alias
#=============================
alias vi='vim'
alias cp='cp -i'
alias mv='mv -i'
alias h='history 25'
alias j='jobs -l'
alias ls='ls -G --color'
alias la='ls -Gah --color'
alias ll='ls -GlAh --color'
alias lf='ls -GFAh --color'


#=============================
# SSH
#=============================
function ssh_screen(){
eval server=\${$#}
screen -t $server ssh "$@"
}
if [ x$TERM = xscreen ]; then
	alias ssh=ssh_screen
fi

if [ "$TERM" = "screen" ]; then
	chpwd () { echo -n "_`dirs`\\" }
	preexec() {
		# see [zsh-workers:13180]
		# http://www.zsh.org/mla/workers/2000/msg03993.html
		emulate -L zsh
		local -a cmd; cmd=(${(z)2})
		case $cmd[1] in
			fg)
			if (( $#cmd == 1 )); then
				cmd=(builtin jobs -l %+)
			else
				cmd=(builtin jobs -l $cmd[2])
			fi
			;;
			%*)
			cmd=(builtin jobs -l $cmd[1])
			;;
			cd)
			if (( $#cmd == 2)); then
				cmd[1]=$cmd[2]
			fi
			;&
			*)
			echo -n "k$cmd[1]:t\\"
			return
			;;
		esac

		local -A jt; jt=(${(kv)jobtexts})

		$cmd >>(read num rest
		cmd=(${(z)${(e):-\$jt$num}})
		echo -n "k$cmd[1]:t\\") 2>/dev/null
	}
	chpwd
fi


#=============================
# SCREEN
#=============================
# [ ${STY} ] || screen -rx || screen -D -RR

#=============================
# source zsh
#=============================
if [ -f ~/.zsh/`hostname`.rc ]; then
	source ~/.zsh/`hostname`.rc
fi

#=============================
# git 
#=============================
if [ -f ~/.git-completion.bash ]; then
	autoload bashcompinit
	bashcompinit
	source ~/.git-completion.bash
fi
