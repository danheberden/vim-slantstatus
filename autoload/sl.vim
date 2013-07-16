let g:sl = {}
let g:sl.index = 0
let g:sl.last = 0
let g:sl.side = 0

function g:sl.highlight(suffix, bg, fg)
  execute 'syn match Statusline' . a:suffix . self.index ' "a^"'
  execute 'hi Statusline' . a:suffix . self.index . ' ctermbg=' . a:bg . ' ctermfg=' . a:fg
endfunction

function! g:sl.segment(command, ...)
  if a:command =~ 'switch'
    let g:sl.side = 1
    execute 'set statusline+=%='
    return
  endif

  let bg = 0 | let fg = 0

  if !empty(a:2)
    let fg = a:2
  endif

  if !empty(a:1)
    let bg = a:1
  endif

  if g:sl.index > 0
    let connectorbg = self.last | let connectorfg = bg
    if self.side == 0
      let connectorbg = bg | let connectorfg = self.last
    endif
    call self.highlight('C', connectorbg, connectorfg)
    
    execute 'set statusline+=%#StatuslineC' . self.index . '#' . (g:sl.side == 1 ? '' : '')
  else 
    set statusline=   " Start statusline
  endif

  let self.index = self.index + 1

  let g:sl.last = bg

  " Highlight this segment
  call g:sl.highlight('', bg, fg)

  " Run command with this highlight
  execute 'set statusline+=%#Statusline' . g:sl.index . '#' . a:command
endfunction

function sl#Segment(...)
  let a = empty(a:1) ? '' : a:1
  let b = empty(a:2) ? 0  : a:2
  let c = empty(a:3) ? 0  : a:3
  call g:sl.segment(a, b, c)
endfunction
