if exists('g:loaded_disco') || &cp
  finish
endif

let g:loaded_disco = '0.0.1' " version number
let s:keepcpo = &cpo
set cpo&vim

command! -nargs=* Disco call discotheque#Run(<q-args>)

let &cpo = s:keepcpo
unlet s:keepcpo

