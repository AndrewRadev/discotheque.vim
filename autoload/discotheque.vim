function! discotheque#Run(pattern)
  let b:discotheque_pattern = a:pattern
  let b:discotheque_match_ids = get(b:, 'discotheque_match_ids', [])

  if b:discotheque_pattern == ''
    " Stop highlighting
    for match_id in b:discotheque_match_ids
      call matchdelete(match_id)
    endfor
    let b:discotheque_match_ids = []
  else
    " Start highlighting
    if !exists('b:discotheque_color')
      let b:discotheque_color = "blue"
      call s:Blue()
    endif

    call add(b:discotheque_match_ids, matchadd('Discotheque', a:pattern))
  end

  augroup Discotheque
    autocmd!

    if b:discotheque_pattern != ''
      autocmd CursorMoved <buffer> call s:Toggle(b:discotheque_pattern)
    endif
  augroup END
endfunction

function! s:Toggle(pattern)
  if b:discotheque_color == "red"
    call s:Red()
    let b:discotheque_color = "blue"
  else
    call s:Blue()
    let b:discotheque_color = "red"
  endif
endfunction

function! s:Blue()
  highlight Discotheque cterm=bold ctermfg=blue guifg=blue gui=bold
endfunction

function! s:Red()
  highlight Discotheque cterm=bold ctermfg=red guifg=red gui=bold
endfunction
