if exists("b:current_syntax")
    finish
endif

" Easy keyword matches
syntax keyword brukGradBlk BLKGRAD UNBLKGRAD
syntax keyword brukAcqu ze zd st0 st exit
syntax match brukAcqu "go=\?" nextgroup=brukLabelName
syntax match brukAcqu "goscnp=\?" nextgroup=brukLabelName
syntax match brukAcqu "goto" nextgroup=brukLabelName
syntax match brukFileMgmt "print" nextgroup=brukString
syntax match brukString ".\+" contained
syntax match brukFileMgmt "wr #\d\+"
syntax match brukFileMgmt "if #\d\+"
syntax match brukFileMgmt "mc #\d\+" nextgroup=brukTo skipwhite
syntax match brukTo "to" contained nextgroup=brukLabelName skipwhite
highlight default link brukGradBlk Keyword
highlight default link brukAcqu Keyword
highlight default link brukFileMgmt Keyword
highlight default link brukString String

" Decoupling
syntax match brukDecouple "cpd[1-8]:f\d"
syntax match brukDecouple "do:f\d"
highlight default link brukDecouple Special

" Operators
syntax match brukOperator "\V+\|*\|-\|/\|="
highlight default link brukOperator Operator

" Durations and other constants
" Here we need a negative lookahead to not match the goto labels.
syntax match brukNumber "\(^\)\@<!\<\d\+\(\.\d\+\)\?\>"
syntax keyword brukNumber PI
syntax match brukNumber "\<EA\d\?\>"
syntax match brukTime "\<\d\+\(\.\d\+\)\?[smu]\>"
highlight default link brukTime Number
highlight default link brukNumber Number

" Looping commands
syntax match brukLoop "lo to" nextgroup=brukLabelName skipwhite
syntax match brukLabelName "\S\+" contained nextgroup=brukTimes skipwhite
syntax match brukTimes "times" contained nextgroup=brukLoopCounter skipwhite
syntax match brukLoopCounter "\S\+" contained contains=brukNumber
highlight default link brukLoop Repeat
" highlight default link brukLabelName Repeat
highlight default link brukTimes Repeat
" highlight default link brukLoopCounter Repeat

" Definitions
syntax region brukDefine matchgroup=String start="^\"" end="\"" oneline
            \ contains=brukParameter,brukTime,brukNumber,brukOperator
syntax match brukParameter "[^="]\+\ze=" contained
highlight default link brukParameter Identifier

" Power levels
syntax match brukPowerLevel "pl\d\{1,2}:f\d"
highlight default link brukPowerLevel Delimiter

" Gradients
syntax match brukGradients "p\d\{1,2}:gp\d\{1,2}"
syntax match brukGradients "gron\d\{1,2}"
syntax match brukGradients "groff"
highlight default link brukGradients Statement

" Pulses
syntax match brukPulse "p\d\{1,2}\(\*\S\+\)\?\(:sp\d\{1,2}\)\? ph\d\{1,2}"
            \ contains=brukNumber,brukOperator
syntax match brukPulse "(p\d\{1,2}\(\*\S\+\)\?\(:sp\d\{1,2}\)\? ph\d\{1,2})"
            \ contains=brukNumber,brukOperator nextgroup=brukPulseChannel
syntax match brukPulse "(p\d\{1,2}\(\*\S\+\)\?\(:sp\d\{1,2}\)\? ph\d\{1,2} p\d\{1,2}\(:sp\d\{1,2}\)\? ph\d\{1,2})"
            \ contains=brukNumber,brukOperator nextgroup=brukPulseChannel
syntax match brukPulseChannel ":f\d\{1,2}" contained
highlight default link brukPulse String
highlight default link brukPulseChannel Delimiter

" C preprocessor stuff
" There's probably a smarter way to do it, see e.g. the C syntax file that
" ships with Vim, but I don't want to get too far ahead of myself.
syntax match brukIncluded "#include <.\+>" contains=brukIncludedFile
syntax match brukIncluded "#include \".\+\"" contains=brukIncludedFile
syntax match brukIncludedFile "<.\+>" contained
syntax match brukIncludedFile "\".\+\"" contained
highlight default link brukIncluded Include
highlight default link brukIncludedFile String

syntax match brukIfdef "#\s*ifdef" nextgroup=brukIfdefIdentifier skipwhite
syntax match brukIfdefIdentifier "[A-Za-z0-9_]\+" contained
syntax match brukElse "#\s*else"
syntax match brukEndif "#\s*endif"
highlight default link brukIfdef Structure
highlight default link brukIfdefIdentifier Structure
highlight default link brukElse Structure
highlight default link brukEndif Structure

syntax match brukDefineDelay "define delay" nextgroup=brukDelayName skipwhite
syntax match brukDelayName "\w\+" contained
syntax match brukDefineGrad "define list<gradient>" nextgroup=brukGradName skipwhite
syntax match brukGradName "\w\+" contained
syntax match brukDefineLoop "define list<loopcounter>" nextgroup=brukLoopName skipwhite
syntax match brukLoopName "\w\+" contained
highlight default link brukDefineDelay Structure
highlight default link brukDefineGrad Structure
highlight default link brukDefineLoop Structure
highlight default link brukDelayName Identifier
highlight default link brukGradName Identifier
highlight default link brukLoopName Identifier

" Comments
syntax region brukComment start=";" end="$" oneline
syntax region brukComment start="//" end="$" oneline
syntax region brukComment start="/\*" end="\*/"
highlight default link brukComment Comment

" Fast syncing. I don't think there's anything inside here that stretches over
" lines, except for C-style multiline comments.
syntax sync match brukSync grouphere NONE '$'
syntax sync maxlines=5

let b:current_syntax = "bruker"
