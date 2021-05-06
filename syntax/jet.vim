" Vim syntax file
" Language: Java Emitter Templates
" Maintainer: Geraldo Luis da Silva Ribeiro
" Latest Revision: 2021-03-23

if exists("b:current_syntax")
  finish
endif

" <%= CodeGenerationUtils.headerFileContent(scaResource) %>


syntax region jetBlockCmd start="<%" end="%>"

let b:current_syntax = "jet"

hi def link jetBlockCmd Comment

" hi def link jetBlockCmd    Statement
" hi def link celTodo        Todo
" hi def link celComment     Comment
" hi def link celHip         Type
" hi def link celString      Constant
" hi def link celDesc        PreProc
" hi def link celNumber      Constant
