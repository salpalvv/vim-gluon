" Vim indent for gluon

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nocindent
setlocal autoindent
setlocal indentexpr=GluonIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*GluonIndent")
  finish
endif

" use shiftwidth function only if it's available
if exists('*shiftwidth')
  func s:sw()
    return shiftwidth()
  endfunc
else
  func s:sw()
    return &sw
  endfunc
endif

function! GluonIndent(lnum)
  let prevlnum = prevnonblank(a:lnum-1)
  if prevlnum == 0
    " top of file
    return 0
  endif

  " grab the previous and current line, stripping comments.
  let prevl = substitute(getline(prevlnum), '//.*$', '', '')
  let thisl = substitute(getline(a:lnum), '//.*$', '', '')
  let previ = indent(prevlnum)

  let ind = previ

  if prevl =~ '[\=({]\s*$'
    let ind += s:sw()
  endif

  if prevl =~ '\v(then|else|with)\s*$'
    let ind += s:sw()
  endif

  if thisl =~ '^\s*[)}]'
    let ind -= s:sw()
  endif

  return ind
endfunction
