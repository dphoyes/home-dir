	if exists("did_load_filetypes")
	  finish
	endif
	augroup filetypedetect
	  au! BufRead,BufNewFile *.tex		setfiletype tex
	  au! BufRead,BufNewFile *.ll		setfiletype lex
	augroup END
