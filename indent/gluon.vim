" Vim indent file
" Language:        gluon

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal sw=4 ts=4 sts=4 et
setlocal indentexpr=GluonIndent(v:lnum)
setlocal indentkeys=!^Fo,O,0#,<:>,-
setlocal nosmartindent

" Only define the function once.
if exists('*GluonIndent')
  finish
endif

function GluonIndent(lnum)
  let prevlnum = ignore_blanks ? prevnonblank(a:lnum - 1) : a:lnum - 1
  if prevlnum == 0
    return 0
  endif
  let prevline = getline(prevlnum)

  let indent = indent(prevlnum)
  let increase = indent + &sw

  " Do not adjust indentation for comments
  if prevline =~ '\%(^\|\s\)#'
    return indent
  elseif prevline =~ ':\s*[>|]?$'
    return increase
  elseif prevline =~ ':$'
    return increase
  elseif prevline =~ '^\s*-\s*$'
    return increase
  elseif prevline =~ '^\s*-\s\+[^:]\+:\s*\S'
    return increase
  else
    return indent
  endif
endfunction
