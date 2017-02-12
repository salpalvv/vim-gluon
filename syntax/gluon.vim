" Language:     Gluon
" Maintainer:   Daniel Collette
" URL:          https://github.com/salpalvv/vim-gluon
" LICENSE:      MIT

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword gluonConditional    match if else with then
syn keyword gluonTypeDef        type
syn keyword gluonKeyword        let in and
syn keyword gluonType           Int Float String Ref Option
syn keyword gluonBoolean        True False
syn keyword gluonTodo contained TODO FIXME NOTE

hi def link gluonConditional    Conditional
hi def link gluonTypeDef        Identifier
hi def link gluonKeyword        Keyword
hi def link gluonType           Type
hi def link gluonBoolean        Boolean
hi def link gluonTodo           Todo

syn match gluonEscape           display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match gluonStringContinuation display contained /\\\n\s*/
syn match gluonShebang          /\%^#![^[].*/
syn match gluonOperator         display "&&\|||"
syn match gluonArrow            display "->"

hi def link gluonShebang        Comment
hi def link gluonOperator       Operator
hi def link gluonArrow          Operator

syn match gluonSeparator        "[,;:]"
syn region gluonParens          matchgroup=gluonDelimiter start="(" end=")"
syn region gluonBrackets        matchgroup=gluonDelimiter start="\[" end="]"
syn region gluonBlock           matchgroup=gluonDelimiter start="{" end="}"

hi def link gluonSeparator      Delimiter
hi def link gluonDelimiter      Delimiter

" Numbers
syn match gluonNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>\|\<0[bB][10]\+\>"
syn match gluonFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

hi def link Integer             Number
hi def link gluonNumber         Number
hi def link gluonFloat          Float

" Strings
syn region gluonString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,gluonStringContinuation,@Spell
syn region gluonString          start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=gluonEscape,gluonStringContinuation,@Spell

hi def link gluonString         String

" Comments
syn region gluonCommentLine     start="//" end="$" contains=gluonTodo,@Spell
syn region gluonCommentLine     start="/\*" end="\*/" contains=gluonTodo,@Spell

hi def link gluonCommentLine    Comment

