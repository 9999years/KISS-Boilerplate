" kiss-boilerplate.vim:  (global plugin) easy boilerplate insertion
" Last Change:           idk check the commit logs
" Maintainer:            rebecca turner
" Version:               1.1.0, for Vim 6.3+
" URL:                   https//github.com/9999years/boiler.vim

" Documentation:
" just call InsertBoilerplate, use an argument to override filetype
" KISS: keep it stupendously simple

if exists('loaded_boilervim')
	finish
endif
let loaded_boilervim = 1

function InsertBoilerplate(...)
	let s:kiss_directory =
	\'$VIM/vimfiles/pack/kiss-boilerplate/start/kiss-boilerplate'

	if exists('g:kiss_boilerplate_root')
		s:kiss_directory = g:kiss_boilerplate_root
	endif

	"you might think: wow, a simple `expand('<sfile>:p:h')` should work!
	"well, it doesn't. if you can get it to work, great! submit a PR please
	"for now, you can override the root dir from the 'suggested' value with
	"g:kiss_boilerplate_root
	let s:file = expand(s:kiss_directory) . '/boilerplate/boiler.'

	"defer to arguments over filetype option if possible, append to ext
	if a:0 > 0
		let s:file .= a:1
		echom a:1
	else
		let s:file .= &filetype
	endif
	"create a mark for restoring cursor position
	normal mb
	"read the file, shell escape, don't give any messages
	"getcurpos()[1] is the line number
	silent! execute getcurpos()[1] . 'read ' . fnameescape(s:file)
	normal `b
	"if we're on a blank line, delete it
	"(otherwise a blank is left when called on empty files)
	if getline('.') == ''
		normal dd
	endif
	return
endfunction

command -nargs=? InsertBoilerplate :call InsertBoilerplate(<args>)

autocmd BufNewFile * InsertBoilerplate
