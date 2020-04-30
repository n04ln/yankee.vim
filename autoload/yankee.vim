scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:cursor = 0

func! s:write(s) abort
  execute ':norm ' . strpart(a:s, 0, 2) . 'p'
endfunc

func! yankee#paste() abort
  let buf_list = copy(g:yankee_buf_list) " NOTE: map is Destructive Function
  let resp = execute(":reg " . join(map(l:buf_list, {_, v -> strpart(v,1,1)}), ' '))
  let resps = split(resp, "\n")
  call remove(resps, 0) " NOTE: remove `--- Registers ---`

  call fzf#run({'source': resps, 'sink': funcref('s:write'), 'down': '25%'})
endfunc

func! yankee#yank() range
  if !exists("g:yankee_buf_list") || len(g:yankee_buf_list) == 0
    echoerr "g:yankee_buf_list is not defined. plz set it!"
    return
  endif

  let reg = s:cursor % len(g:yankee_buf_list)
  echom "yank to " . g:yankee_buf_list[l:reg] . " buffer."

  execute ':norm gv' . g:yankee_buf_list[l:reg] . 'y'
  execute ':norm gv' . '"+' . 'y'

  let s:cursor += 1

  " NOTE: To avoid Integer Overflow
  if s:cursor == len(g:yankee_buf_list)
    let s:cursor = 0
  endif
endfunc

let &cpo = s:save_cpo
unlet s:save_cpo
