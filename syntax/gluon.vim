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

" Integers
syn match gluonDecimalInt       "\<-\=\d\+\%([Ee][-+]\=\d\+\)\=\>"
syn match gluonHexadecimalInt   "\<-\=0[xX]\x\+\>"
syn match glOctalInt            "\<-\=0\o\+\>"

hi def link gluonDecimalInt     Integer
hi def link gluonHexadecimalInt Integer
hi def link gluonOctalInt       Integer
hi def link Integer             Number

" Floating point
syn match gluonFloat            "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match gluonFloat            "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"

hi def link gluonFloat          Float

" Strings
syn region gluonString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,gluonStringContinuation,@Spell
syn region gluonString          start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=gluonEscape,gluonStringContinuation,@Spell

hi def link gluonString         String

" Comments
syn region gluonCommentLine     start="//" end="$" contains=gluonTodo,@Spell
syn region gluonCommentLine     start="/\*" end="\*/" contains=gluonTodo,@Spell

hi def link gluonCommentLine    Comment

