"   # Arquivo de configuração do vim do Geraldo Ribeiro
"   
"   ## Instalação
"
"   ```
"   git clone ssh://git@intmain.io:8322/geraldoim/dot_vim.git ~/.vim
"   ln -s ~/.vim/vimrc .vimrc
"   mkdir -p ~/.vim/bundle
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   vim +BundleInstall +qall
"   ```
"

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

"   ## Plugins
"{{{
" configura o path de inclusão do Vundle e inicia
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"}}}

" http://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html

"   ### Utilitários
"{{{
Plugin 'powerline/powerline-fonts'
"Plugin 'geraldolsribeiro/vim-conceal'
"Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
"}}}

"   ### Plugins genéricos para programação
"{{{
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'
"}}}

"   ### Markdown / Escrita
"{{{
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'junegunn/vim-emoji'
"Plugin 'kyuhi/vim-emoji-complete' " dá pau com o git

" Encontra erros de escrita
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-lexical'
" Desabilitado por padrão
let g:pandoc#biblio#use_bibtool=1
"}}}

"   ### Git Support
"{{{
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'   " lerda muito
"}}}

" " PHP Support
" Plugin 'phpvim/phpcd.vim'
" Plugin 'tobyS/pdv'
"
"   ### Erlang Support
"{{{
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-compiler'
"}}}

"   ### Elixir Support 
"{{{
Plugin 'elixir-lang/vim-elixir'
Plugin 'avdgaag/vim-phoenix'
Plugin 'mmorearty/elixir-ctags'
Plugin 'mattreduce/vim-mix'
Plugin 'BjRo/vim-extest'
Plugin 'frost/vim-eh-docs'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jadercorrea/elixir_generator.vim'
"}}}

" " Elm Support
" Plugin 'lambdatoast/elm.vim'

"   ### Theme / Interface
"{{{
Plugin 'AnsiEsc.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'colepeters/spacemacs-theme.vim'
"}}}


"   ## Configuração geral

"{{{
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
"}}}

" FIXME: Separar os cara abaixo
"
"Bundle 'aming/vim-mason'
Plugin 'airblade/vim-gitgutter'
Plugin 'aklt/plantuml-syntax'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'larsbs/vimtom' "Vim Vimtom Colorscheme - saporra só funciona no gui
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
"Plugin 'scrooloose/vim-slumlord'
Plugin 'rhysd/vim-gfm-syntax'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'

" Formatação de código
Plugin 'rhysd/vim-clang-format'

" Ver documentação em: https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'

" Conflita com newmake
"Plugin 'w0rp/ale'


"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

"Bundle 'jasoncodes/ctrlp-modified.vim'


" Trava o instalador!
"Plugin 'git://git.wincent.com/command-t.git'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Finish Vundle install
"

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

"let &runtimepath.=',~/.vim/bundle/ale'

set background=dark
"colorscheme abbott
"colorscheme wombat
colorscheme molokai

"
"let g:solarized_termcolors=16
"let g:solarized_termtrans = 1
"colorscheme solarized

"colorscheme vimtom

"   ## Configuração do neomake
"{{{
let g:neomake_open_list = 2
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/neomake_error.log'
let g:neomake_highlight_columns=1
"}}}

"autocmd! BufWritePost * Neomake
"   ### Coffeescript
"{{{
"   npm install -g coffeelint
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
"}}}

"   ### Elixir
"{{{
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
"}}}


"   ### ruby 
"{{{

"}}}


"   ### SCSS
"{{{
let g:neomake_scss_enabled_markers = ['scss-lint']
"}}}



" Vim-Airline Configuration
":h airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
"let g:airline_left_sep='>'

let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]

if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata\ 14
    set guifont=Noto\ Mono\ 14
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
  hi Search guibg=peru guifg=wheat
  hi IncSearch guibg=white guifg=red
else
  hi Search cterm=NONE ctermfg=grey ctermbg=blue
  hi IncSearch cterm=NONE ctermbg=white ctermfg=red
endif

" -------------------------------------------------------------------
" Configuração semelhante ao nerdtree
" copiado de https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 " Mantem a arvore aberta
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  "autocmd VimEnter * :Vexplore
augroup END

let g:markdown_fenced_languages = ['vim', 'html', 'python', 'bash=sh', 'ruby', 'eruby', 'javascript', 'elixir', 'sql', 'html']

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" -------------------------------------------------------------------
" Executar a linha atual
nmap <F12> :exec '!'.getline('.')<CR>
nmap <S-F12> :exec '!ssh vm01 "'.getline('.').'"'<CR>

" <F2> to save
nmap <F2> :w<cr>
imap <F2> <c-o>:w<cr>

" <F6> para trocar de buffer
nmap <F6> :bn<CR>

" <F7> para ir para o próximo erro
nmap <F7> :cnext<CR>
nmap <S-F7> :cprev<CR>

" <F9> para compilar
nmap <F9> :make<CR>

" <F8> para fechar o buffer atual
nmap <F8> :bp\|bd #<CR>

set modeline
set modelines=5

" Para não ignorar ~/.vim/after/ftplugin/xxx.vim
" filetype plugin on

set hlsearch
set tabstop=2 shiftwidth=2 expandtab
set smarttab
set softtabstop=0
set nowrap
set hidden "Premite mudar de buffer sem salvar, mantendo-o na memória

set smartcase

" Command T settings
"let g:CommandTInputDebounce = 200
"let g:CommandTFileScanner = "watchman"
"let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*" . ",**/node_modules/*" . ",**/vendor/*"
"let g:CommandTMaxHeight = 30
"let g:CommandTMaxFiles = 500000

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" localvimrc
let g:localvimrc_ask = 1
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2

set noerrorbells
set visualbell

let g:slumlord_plantuml_jar_path = "~/bin/plantuml.jar"

" Use ack instead of grep
set grepprg=ack
set ignorecase


"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Removes trailing spaces
" Refatorar para salvar a posição atual
function!TrimWhiteSpace()
  %s/\s*$//
endfunction

set list listchars=tab:»·,trail:·
"autocmd FileWritePre * call TrimWhiteSpace()
"autocmd FileAppendPre * call TrimWhiteSpace()
"autocmd FilterWritePre * call TrimWhiteSpace()
"autocmd BufWritePre * call TrimWhiteSpace()


highlight MyFix ctermbg=darkred ctermfg=white guibg=red guifg=white
augroup HiglightMyFix
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'TODO:', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'FIXME:', -1)
augroup END

set path=.,~/git/
",**/

"map <Leader>m :CtrlPModified<CR>
"map <Leader>M :CtrlPBranch<CR>
"
"let g:ctrlp_cmd = 'CtrlPMixed'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:50'


" Emoji
"if emoji#available()
"  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"  let g:gitgutter_sign_modified_removed = emoji#for('collision')
"endif


"let g:gitgutter_sign_added = '+ '
"let g:gitgutter_sign_modified = '~ '
"let g:gitgutter_sign_removed = '- '
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

" Ignorar espaços em branco
"let g:gitgutter_diff_args = '-w'


" Usar Ctrl+X Ctrl+U
set completefunc=emoji#complete

set mousemodel=extend
set mouse+=a

nnoremap <F3> :CtrlPTag<CR>
nmap <C-UP> :m-2<CR>
nmap <C-DOWN> :m+1<CR>

set colorcolumn=28,120
" set cursorline

" Integração com psql -> \e
" veja o arquivo ~/.vim/syntax/dbout.vim
" use antes do psql
" export PAGER='vim -R -u ~/.vimrcpg -'
" https://unencumberedbyfacts.com/2016/01/04/psql-vim-happy-face/
au BufRead /tmp/psql.edit.* set syntax=sql

let spell_language_list="brasileiro,american"
let spell_auto_type="md,tex,doc,mail"

"let g:pandoc#spell#default_langs=["brasileiro","american"]
let g:pandoc#spell#default_langs=[]

set wildignore+=*/git/opa/rel/*
set wildignore+=*/git/*/node_modules
set wildignore+=**/tmp/**

set ttyfast

set tags=tags

set autoread

set number

"   ## Melhorar a visibilidade da indentação
"   Incluir `Plugin 'Yggdroot/indentLine'` no vundle.
"{{{
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_setConceal = 0
"}}}

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" ver https://github.com/reedes/vim-lexical
let g:lexical#spell = 1
" http://ftp.vim.org/vim/runtime/spell
let g:lexical#spelllang = ['en_us','pt_br',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]

" clang-format

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,
            \ "AlignConsecutiveAssignments" : "true",
            \ "AlignConsecutiveDeclarations" : "true",
            \ "AlignTrailingComments" : "true",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakBeforeBinaryOperators" : "true",
            \ "ColumnLimit" : 120,
            \ "BreakBeforeBraces" : "Allman",
            \ "MaxEmptyLinesToKeep" : 2,
            \ "SpaceBeforeParens" : "Never",
            \ "SpacesInParentheses": "true",
            \ "Standard" : "C++11",
            \ "TabWidth" : 4,
            \ "UseTab" : "Never"
            \ }

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>



" vim: foldmethod=marker
