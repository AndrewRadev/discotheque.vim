function! disco#Run(pattern)
  let b:disco_pattern = a:pattern
  let b:disco_match_ids = get(b:, 'disco_match_ids', [])

  if b:disco_pattern == ''
    " Stop highlighting
    for match_id in b:disco_match_ids
      call matchdelete(match_id)
    endfor
    let b:disco_match_ids = []
  else
    " Start highlighting
    if !exists('b:disco_color')
      let b:disco_color = "blue"
      call s:Blue()
    endif

    call add(b:disco_match_ids, matchadd('Disco', a:pattern))
  end

  augroup Disco
    autocmd!

    if b:disco_pattern != ''
      autocmd CursorMoved <buffer> call s:Toggle(b:disco_pattern)
    endif
  augroup END
endfunction

function! s:Toggle(pattern)
  if b:disco_color == "red"
    call s:Red()
    let b:disco_color = "blue"
  else
    call s:Blue()
    let b:disco_color = "red"
  endif
endfunction

function! s:Blue()
  highlight Disco cterm=bold ctermfg=blue guifg=blue gui=bold
endfunction

function! s:Red()
  highlight Disco cterm=bold ctermfg=red guifg=red gui=bold
endfunction
