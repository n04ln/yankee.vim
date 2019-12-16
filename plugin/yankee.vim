scriptencoding utf-8

if exists('g:loaded_yankee')
    finish
endif
let g:loaded_yankee = 1

let s:save_cpo = &cpo
set cpo&vim

vnoremap <silent> <C-y>y :call yankee#yank()<CR>
nnoremap <silent> <C-y>p :call yankee#paste()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
