scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:cursor = 0

func! s:write(s) abort
  execute ':norm ' . strpart(a:s, 0, 2) . 'p'
endfunc

func! yankee#paste() abort
  let resp = execute(":reg " . join(g:yankee_buf_list, ' '))
  let resps = split(resp, "\n")
  call remove(resps, 0)
  call fzf#run({'source': resps, 'sink': funcref('s:write')})
endfunc

func! yankee#yank() range
  if len(g:yankee_buf_list) == 0
    echoerr "g:yankee_buf_list is not defined. plz set it!"
    return
  endif

  let reg = s:cursor % len(g:yankee_buf_list)
  echom "yank to " . g:yankee_buf_list[l:reg] . " buffer."
  execute ':norm gv"' . g:yankee_buf_list[l:reg] . 'y'
  let s:cursor += 1
endfunc

let &cpo = s:save_cpo
unlet s:save_cpo
