let g:slantstatus = {}
let g:slantstatus.index = 0
let g:slantstatus.last = 0
let g:slantstatus.side = 0

function g:slantstatus.highlight(suffix, bg, fg)
  execute 'syn match Statusline' . a:suffix . self.index ' "a^"'
  execute 'hi Statusline' . a:suffix . self.index . ' ctermbg=' . a:bg . ' ctermfg=' . a:fg
endfunction

function! g:slantstatus.segment(command, ...)
  if a:command =~ 'switch'
    let g:slantstatus.side = 1
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

  if g:slantstatus.index > 0
    let connectorbg = self.last | let connectorfg = bg
    if self.side == 0
      let connectorbg = bg | let connectorfg = self.last
    endif
    call self.highlight('C', connectorbg, connectorfg)
    
    execute 'set statusline+=%#statuslineC' . self.index . '#' . (g:slantstatus.side == 1 ? '' : '')
  else 
    set statusline=   " Start statusline
  endif

  let self.index = self.index + 1

  let g:slantstatus.last = bg

  " Highlight this segment
  call g:slantstatus.highlight('', bg, fg)

  " Run command with this highlight
  execute 'set statusline+=%#statusline' . g:slantstatus.index . '#' . a:command
endfunction

function slantstatus#Segment(...)
  let a = empty(a:1) ? '' : a:1
  let b = empty(a:2) ? 0  : a:2
  let c = empty(a:3) ? 0  : a:3
  call g:slantstatus.segment(a, b, c)
endfunction
