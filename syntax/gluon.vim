" Language:     Gluon
" Maintainer:   Daniel Collette
" URL:          https://github.com/salpalvv/vim-gluon
" LICENSE:      MIT

if exists("b:current_syntax")
    finish
endif

syn keyword gluonConditional    match if else with then
syn keyword gluonTypeDef        type
syn keyword gluonKeyword        let in and
syn keyword gluonType           Int Float String Ref Option
syn keyword gluonBoolean        True False
syn keyword gluonTodo contained TODO FIXME NOTE

syn match gluonEscape           display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match gluonStringContinuation display contained /\\\n\s*/
syn match gluonShebang          /\%^#![^[].*/
syn match gluonOperator         display "&&\|||"
syn match gluonArrow            display "->"
"syn match gluonDecNumber        display "\<[0-9][0-9_]*\="
"syn match gluonDecNumber        display "\<[0-9][0-9_]*\="

syn region gluonString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,gluonStringContinuation,@Spell
syn region gluonCommentLine     start="//" end="$" contains=gluonTodo,@Spell

hi def link gluonConditional    Conditional
hi def link gluonTypeDef        Identifier
hi def link gluonKeyword        Keyword
hi def link gluonType           Type
hi def link gluonBoolean        Boolean
hi def link gluonString         String
hi def link gluonTodo           Todo
hi def link gluonCommentLine    Comment
hi def link gluonShebang        Comment
hi def link gluonOperator       Operator
hi def link gluonArrow          Operator

