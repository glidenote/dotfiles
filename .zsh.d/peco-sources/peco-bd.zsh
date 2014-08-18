function peco-bd () {
    local num=${#${(ps:/:)${PWD}}}
    local i
    local pathes

    for i in {$((num+1))..2}; do
        if [ -n $pathes ]; then
            pathes="${pathes}\n"
        fi
        pathes="${pathes}`echo $PWD | cut -d '/' -f1-$i`"
    done

    local selected=$(echo $pathes | peco)

    if [ -n "$selected" ]; then
        BUFFER="cd ${selected}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-bd

bindkey '^xb' peco-bd
