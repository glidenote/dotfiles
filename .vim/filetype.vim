if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd BufRead,BufNewFile *.markdown setfiletype octopress
    autocmd BufRead,BufNewFile *.md       setfiletype octopress
augroup END

