#=============================
# autojump for centos
#=============================
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

#=============================
# autojump for mac
#=============================
case "${OSTYPE}" in
  darwin*)
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    ;;
esac
