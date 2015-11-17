source ~/.zsh.d/antigen/antigen.zsh

antigen-use oh-my-zsh

antigen bundle git
antigen bundle mollifier/anyframe
antigen bundle knife
antigen bundle docker
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen-theme bira
# antigen-theme gnzh
antigen-theme pygmalion
# antigen-theme sunrise
# antigen-theme ys

antigen-apply
