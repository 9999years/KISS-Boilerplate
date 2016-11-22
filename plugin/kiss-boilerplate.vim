" kiss-boilerplate.vim:  (global plugin) easy boilerplate insertion
" Last Change:           idk check the commit logs
" Maintainer:            rebecca turner
" Version:               2.2.0, for Vim 7.0+
" URL:                   https://github.com/9999years/KISS-Boilerplate
" Documentation:
" It just works! But seriously, check ../doc/kiss-boilerplate.txt

if exists('g:loaded_kiss_boilerplate')
	finish
endif
let g:loaded_kiss_boilerplate = 1

"kiss_boilerplate_synonyms registers keys as synonyms to filetypes
if !exists('g:kiss_boilerplate_synonyms')
	let g:kiss_boilerplate_synonyms = {
		\'pgf': 'pgfplots',
		\'plaintex': 'tex',
		\'youcompleteme': 'ycm',
		\'cpp': 'c',
		\'cc': 'c',
		\'c++': 'c',
		\'mit/expat': 'mit',
		\'expat': 'mit'
		\}
endif

"refreshes the base filepath
function KISSReload()
	"get the root plugin directory
	"set a default
	if !exists('g:kiss_boilerplate_root')
		let g:kiss_boilerplate_root =
		\'$VIM/vimfiles/pack/KISS-Boilerplate/start/KISS-Boilerplate'
		"\expand('<sfile>:p:h') . '../boilerplate/'
	endif
	"if root directory doesn't exist, throw error
	if len(glob(g:kiss_boilerplate_root)) == 0
		\ && !exists('g:kiss_silence_errors')
		echoerr "KISSerr1: The directory KISS-Boilerplate expects to find boilerplate files in (g:kiss_boilerplate_root) doesn't seem to exist! Since you're reading this message, the plugin has loaded --- make sure that g:kiss_boilerplate_root is set to the correct directory!"
		echoerr "g:kiss_boilerplate_root = "
			\ . expand(g:kiss_boilerplate_root)
	endif
	let s:basefile =
		\ expand(g:kiss_boilerplate_root) . '/boilerplate/boiler.'
	return
endfunction

function KISSInsertBoilerplate(...)
	let l:file = s:basefile
	"defer to arguments over filetype option if possible
	if a:0 > 0
		let l:filetype = a:1
	else
		let l:filetype = &filetype
	endif
	"if a synonym exists, use it
	if has_key(g:kiss_boilerplate_synonyms, l:filetype)
		let l:filetype = g:kiss_boilerplate_synonyms[l:filetype]
	endif
	"add the ft to the end of the path variable
	let l:file .= l:filetype
	"create a mark for restoring cursor position before we read anything
	normal mb
	"read the file, shell escape, don't give any messages
	"getcurpos()[1] is the line number
	silent! execute getcurpos()[1] . 'read ' . fnameescape(l:file)
	normal `b
	"if we're on a blank line, delete it
	"(otherwise a blank is left when this is called on an empty file)
	if getline('.') == ''
		normal dd
	endif
	return
endfunction

command -nargs=? KISSInsertBoilerplate :call KISSInsertBoilerplate(<args>)

autocmd BufNewFile * KISSInsertBoilerplate

function KISSEditBoilerplate(filetype)
	let l:file = s:basefile
	let l:file .= a:filetype
	execute 'edit ' . fnameescape(l:file)
	setlocal noeol
	return
endfunction

command -nargs=1 KISSEditBoilerplate :call KISSEditBoilerplate(<args>)

"populate g:kiss_boilerplate_root
call KISSReload()
