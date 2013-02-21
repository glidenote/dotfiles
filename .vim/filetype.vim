if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd BufRead,BufNewFile *.markdown setfiletype octopress
    autocmd BufRead,BufNewFile *.md       setfiletype octopress
    autocmd BufRead,BufNewFile .pryrc     setfiletype ruby
    autocmd BufRead,BufNewFile Gemfile    setfiletype ruby
    autocmd BufRead,BufNewFile .vimrc.mac setfiletype vim
augroup END

