" As linhas abaixo foram adicionadas conforme
" https://github.com/mhaig/vim-blockdiag-series

if did_filetype()
    finish
endif

let s:line1 = getline(1)

"" blockdiag series
if s:line1 =~ '\<diagram\|blockdiag\>\s*{'
    setfiletype blockdiag
elseif s:line1 =~ '\<seqdiag\>\s*{'
    setfiletype seqdiag
elseif s:line1 =~ '\<actdiag\>\s*{'
    setfiletype actdiag
elseif s:line1 =~ '\<nwdiag\>\s*{'
    setfiletype nwdiag
elseif s:line1 =~ '\<rackdiag\>\s*{'
    setfiletype rackdiag
elseif s:line1 =~ '\<packetdiag\>\s*{'
    setfiletype packetdiag
endif

unlet s:line1

" vim: ft=vim
