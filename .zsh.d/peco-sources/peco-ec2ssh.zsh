function peco-ec2ssh () {
    local selected_dir=$(ec2list | peco --query "$LBUFFER" | cut -f 4)
    if [ -n "$selected_dir" ]; then
        BUFFER="ssh ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ec2ssh
bindkey '^xs' peco-ec2ssh
