#=============================
# rbenv
# http://qiita.com/sonots/items/a309520b9cce1b7631a5
#=============================
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
  eval "$(rbenv init --no-rehash -)"
fi
