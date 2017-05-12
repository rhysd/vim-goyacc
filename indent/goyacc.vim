" Vim indent file
" Language:         YACC input file
" Original Author:       Nikolai Weibull <now@bitwi.se>
" Current Author:        rhysd <lin90162@yahoo.co.jp>

" Currently vim-goyacc uses the same function as default yacc indentation
" support.

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

" Inherit Go's indentation configuration
runtime indent/go.vim

let b:did_indent = 1

setlocal indentexpr=GetGoYaccIndent()
setlocal nosmartindent

" Only define the function once.
if exists("*GetGoYaccIndent")
  finish
endif

function GetGoYaccIndent()
  if v:lnum == 1
    return 0
  endif

  let ind = indent(v:lnum - 1)
  let line = getline(v:lnum - 1)

  if line == ''
    let ind = 0
  elseif line =~ '^\w\+\s*:'
    let ind = ind + matchend(line, '^\w\+\s*')
  elseif line =~ '^\s*;'
    let ind = 0
  else
    let ind = GoIndent(v:lnum) 
  endif

  return ind
endfunction
