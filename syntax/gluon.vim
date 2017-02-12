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

syn match gluonEscape           display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match gluonStringContinuation display contained /\\\n\s*/
syn region gluonString           start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,glionStringContinuation,@Spell

hi def link gluonConditional    Conditional
hi def link gluonTypeDef        Identifier
hi def link gluonKeyword        Keyword
hi def link gluonType           Type
hi def link gluonBoolean        Boolean
hi def link gluonString         String

