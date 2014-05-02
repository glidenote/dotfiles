function percol-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        percol --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N percol-select-history
