" Language:     Gluon
" Maintainer:   Daniel Collette
" URL:          https://github.com/salpalvv/vim-gluon
" LICENSE:      MIT

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword gluonConditional    match if else with then import
syn keyword gluonTypeDef        type
syn keyword gluonKeyword        let in and
syn keyword gluonType           Int Float String Ref
syn keyword gluonType           Option Result Ordering
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
syn match gluonOperator        "\v\*"
syn match gluonOperator        "\v/"
syn match gluonOperator        "\v\+"
syn match gluonOperator        "\v-"
syn match gluonOperator        "\v\?"
syn match gluonOperator        "\->"
syn match gluonOperator        "\v\="

hi def link gluonShebang        Comment
hi def link gluonOperator       Operator

syn match gluonSeparator        "[,;:|]"
syn region gluonParens          matchgroup=gluonDelimiter start="(" end=")" transparent
syn region gluonBrackets        matchgroup=gluonDelimiter start="\[" end="]" transparent
syn region gluonBlock           matchgroup=gluonDelimiter start="{" end="}" transparent

hi def link gluonSeparator      Delimiter
hi def link gluonDelimiter      Delimiter

" Numbers
syntax match gluonNumber        "\v<\d+>"
syntax match gluonNumber        "\v<\d+\.\d+>"
syntax match gluonNumber        "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match gluonNumber        "\v<0x\x+([Pp]-?)?\x+>"
syntax match gluonNumber        "\v<0b[01]+>"
syntax match gluonNumber        "\v<0o\o+>"

hi def link Integer             Number
hi def link gluonNumber         Number

" Strings
syn region gluonString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gluonEscape,gluonStringContinuation,@Spell
syn region gluonString          start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=gluonEscape,gluonStringContinuation,@Spell

hi def link gluonString         String

" Comments
syn region gluonCommentLine     start="//" end="$" contains=gluonTodo,@Spell
syn region gluonCommentLine     start="/\*" end="\*/" contains=gluonTodo,@Spell

hi def link gluonCommentLine    Comment

