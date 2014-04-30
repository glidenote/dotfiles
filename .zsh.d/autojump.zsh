#=============================
# autojump for centos
#=============================
[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

#=============================
# autojump for mac
#=============================
case "${OSTYPE}" in
  darwin*)
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    ;;
esac
