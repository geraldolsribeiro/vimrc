" Arquivo de sintaxe para ndn-cxx
" Mantainer: Geraldo Luis da Silva Ribeiro

if exists("b:current_syntax")
  finish
endif

" Keywords
" syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElemente2
syn keyword ndnKeyword log general tables strategy_choice network_region 
syn keyword ndnKeyword face_system unix tcp udp websocket
syn keyword ndnKeyword whitelist blacklist netdev_bound
syn keyword ndnKeyword authorizations authorize privileges
syn keyword ndnKeyword rib auto_prefix_propagate
syn keyword ndnConstant NONE ERROR WARN INFO DEBUG TRACE ALL 

" Matches
"syn match syntaxElementMatch 'regex' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite

syn match ndnComment ";.*$"
syn match ndnStatement "^\s*\w\+\s\+\S\+"

" Regions
" syn region syntaxElementRegion start='x' end='y'

hi def link ndnComment Comment
hi def link ndnConstant Constant
hi def link ndnStatement Statement
hi def link ndnKeyword Type

" hi def link name1 Todo
" hi def link name1 Comment
" hi def link name1 Statement
" hi def link name1 Type
" hi def link name1 Constant
" hi def link name1 PreProc
" hi def link name1 Constant

