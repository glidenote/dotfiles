if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	autocmd BufRead,BufNewFile *.markdown       setfiletype octopress
augroup END

