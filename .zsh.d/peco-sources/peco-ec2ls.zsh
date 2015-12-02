function peco-ec2ls () {
    local selected_host=$(ec2ls | expand | peco --layout=bottom-up --query "$LBUFFER" | awk '{print $6}')
    if [ -n "$selected_host" ]; then
        BUFFER="ssh ${selected_host}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ec2ls
bindkey '^xs' peco-ec2ls
