"   # vimrc: Arquivo de configuração do vim do Geraldo Ribeiro
"   
"   [TOC]
"   
"   ## Instalação
"   
"   ```bash
"    # Clona o repositório da intmain
"   git clone ssh://git@intmain.io:8322/geraldoim/dot_vim.git ~/.vim
"    # ou do github
"   git clone https://github.com/geraldolsribeiro/vimrc.git ~/.vim
"   
"    # Aponta o arquivo de configuração para a configuração personalizada
"   ln -s ~/.vim/vimrc .vimrc
"   
"    # Baixa todos os plugins relacionados na configuração
"   mkdir -p ~/.vim/bundle
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   vim +BundleInstall +qall
"   ```
"   
"   ## Atualização
"   
"   Para atualizar os plugins utilize o comando abaixo
"   
"   ```bash
"   vim +VundleUpdate +qall
"   ```
"   
"   ## Outras dependências
"   
"   ```bash
"   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"   ~/.fzf/install
"   ```
"   
set nocompatible              " be iMproved, required
filetype off                  " Necessário estar off antes do Vundle
syntax on
"   
"   ## Plugins
"   
"   Configura o path de inclusão do `Vundle` e o inicia.
"   
"{{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"}}}

" http://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html

"   
"   ### FZF
"   
"{{{
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
"}}}
"   
"   ### Cucumber
"   
"{{{
Plugin 'tpope/vim-cucumber.git'
"}}}
"   
"   ### Servidores web
"   
"{{{
Plugin 'chr4/nginx.vim'
"}}}
"   ### Utilitários
"   
"{{{
Plugin 'powerline/powerline-fonts'
"Plugin 'geraldolsribeiro/vim-conceal'
"Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'

Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'dhruvasagar/vim-table-mode.git'
"}}}
"   
"   ### Plugins genéricos para programação
"   
"{{{
"Plugin 'jakedouglas/exuberant-ctags'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'
"}}}
"   
"   ### Comentários
"   
"{{{
Plugin 'tomtom/tcomment_vim'
"   Para definir o comentário para um novo tipo use:
"   
"   ```
"   autocmd FileType xyz set commentstring=#\ %s
"   ```
"
"   * `g<` descomenta a seleção
"   * `g>` comenta a seleção
"   * `leader_p` comenta parágrafo
"}}}
"   
"   ### Markdown / Escrita
"   
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
"   
"   ### Git Support
"   
"{{{
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'   " lerda muito
"}}}
"   
"   ### Dart
"   
"{{{
Plugin 'dart-lang/dart-vim-plugin'
" Enable HTML syntax highlighting inside Dart strings with let dart_html_in_string=v:true (default false).
" Disable highlighting of core library classes with let dart_corelib_highlight=v:false (default true).
" Enable Dart style guide syntax (like 2-space indentation) with let dart_style_guide = 2
" Enable DartFmt execution on buffer save with let dart_format_on_save = 1
"}}}
"   
"   ### C++
"   
"{{{
" This file contains additional syntax highlighting that I use for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
"}}}

" " PHP Support
" Plugin 'phpvim/phpcd.vim'
" Plugin 'tobyS/pdv'
"   
"   ### Erlang Support
"   
"{{{
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-compiler'
"}}}
"   
"   ### Elixir Support 
"   
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
"   
"   ### Theme / Interface / Color Scheme
"   
"{{{
Plugin 'flazz/vim-colorschemes'
Plugin 'agude/vim-eldar'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'larsbs/vimtom' "Vim Vimtom Colorscheme - saporra só funciona no gui
Plugin 'AnsiEsc.vim'
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
"   
"   ### Devicons
"   
"{{{
Plugin 'ryanoasis/vim-devicons'
Plugin 'ryanoasis/vim-webdevicons'
let g:DevIconsEnableFolderExtensionPatternMatching = 0
let g:DevIconsEnableFoldersOpenClose = 0
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable = 1 " habilita o plugin
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['java'] = '☕'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['coffee'] = '☕'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = '🐚'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cpp'] = '🗡️'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hpp'] = '🗡️'

let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol   = '📝' " quando não tem símbolo definido
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁' " pasta fechada
let g:DevIconsDefaultFolderOpenSymbol                    = '📂' " pasta aberta

let g:WebDevIconsOS = 'Darwin'

" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt


" After a re-source fixes the bug with the [] around devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
"}}}
"   
"   ### Nerdtree
"   
"{{{
Plugin 'scrooloose/nerdtree'
"let g:NERDTreeDirArrows=0 " Não mostrar símbolos na lateral dos nomes
" Improves performance of the SyntaxHighlighting and removes the lag
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'hpp', 'py', 'md', 'txt', 'java', 'sh', 'vim', 'json']
let g:NERDTreeIgnore = ['\.o$', '\.pyc$', '\~$', '\.gif', '\.jpg', '\.png']

" Removes the little arrows that indicate whether a folder is open or not
" These are not needed anymore because of the folder icons from devicons
" let NERDTreeDirArrowExpandable = "\u00a0"
" let NERDTreeDirArrowCollapsible = "\u00a0"
" let NERDTreeNodeDelimiter = "\x07"

"removes the Help message at the top of the NERDTree
let NERDTreeMinimalUI=1

" Needed to remove the '/' from behind the directory names in NerdTree
" augroup nerdtreehidecwd
"	autocmd!
"	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
"augroup end

let g:NERDTreeChDirMode = 2 " Vai para o diretório
let g:NERDTreeMouseMode = 3 " Abre com um clique
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHijackNetrw = 1
" let NERDTreeDirArrowExpandable=">"
" let NERDTreeDirArrowCollapsible="v"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeNodeDelimiter="😀"
"
"
" " Nerd_Commenter 注释增强 <Leader>c<Space>
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCommentEmptyLines = 0
" let g:NERDTrimTrailingWhitespace = 1

"}}}
"   
"   ### TOML
"   
"{{{
Plugin 'cespare/vim-toml'
"}}}
"   
"   ### Typescript
"   
"{{{
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim.git'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

autocmd BufNewFile,BufRead *.ts set syntax=typescript
"}}}
"   
"   ### Typescript
"   
"{{{
Plugin 'shinglyu/vim-codespell'
:autocmd BufWritePre *.java :Codespell
"}}}
"   
"   ### Dark powered neo-completion
"   
"{{{

"if has('nvim')
"  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plugin 'Shougo/deoplete.nvim'
"  Plugin 'roxma/nvim-yarp'
"  Plugin 'roxma/vim-hug-neovim-rpc'
"endif 

"let g:deoplete#enable_at_startup = 1
"}}}
"   
"   ## Metatrader
"   
"{{{
Plugin 'rupurt/vim-mql5'
"}}}
"   ## Configuração geral
"   
"{{{
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
"}}}

Plugin 'chrisbra/Colorizer'  " Exibe cores #fff
let g:colorizer_auto_filetype='css,html,scss'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

" Plugin 'terryma/vim-multiple-cursors'
" let g:multi_cursor_use_default_mapping=0
"
" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" FIXME: Separar os cara abaixo
"
"Bundle 'aming/vim-mason'
Plugin 'airblade/vim-gitgutter'
Plugin 'aklt/plantuml-syntax'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
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


Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }


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

"let &runtimepath.=',~/.vim/bundle/ale'

"
"let g:solarized_termcolors=16
"let g:solarized_termtrans = 1
"colorscheme solarized

"   
"   ## Configuração do neomake
"   
"{{{
let g:neomake_open_list = 2
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/neomake_error.log'
let g:neomake_highlight_columns=1
"}}}

"autocmd! BufWritePost * Neomake
"   
"   ### Coffeescript
"   
"{{{
"   npm install -g coffeelint
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffeelint.json"
"}}}
"   
"   ### Elixir
"   
"{{{
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
"}}}
"   
"   ### Java
"   
"{{{

"}}}
"   
"   ### ruby 
"   
"{{{

"}}}
"   
"   ### SCSS
"   
"{{{
let g:neomake_scss_enabled_markers = ['scss-lint']
"}}}
"   
"   ### vim-table-mode
"   
"{{{
" tabelas em formato markdown
let g:table_mode_corner='|'
"}}}


" Vim-Airline Configuration
":h airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 0
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

augroup javascript
  au!
  " JavaScript, ECMAScript
  au BufNewFile,BufRead *.js,*.javascript,*.es,*.jsx   setf javascript
  " JS++
  au BufNewFile,BufRead *.jpp,*.jspp                   setf jspp
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


set modeline
set modelines=5

" Para não ignorar ~/.vim/after/ftplugin/xxx.vim
filetype plugin on

set hlsearch
" Comentei para tratar plugin do java
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

"set list listchars=tab:»·,trail:·
set list listchars=tab:▸\ ,trail:·,nbsp:_
"set list listchars=tab:▸\ ,trail:·,eol:↴,nbsp:_
"autocmd FileWritePre * call TrimWhiteSpace()
"autocmd FileAppendPre * call TrimWhiteSpace()
"autocmd FilterWritePre * call TrimWhiteSpace()
"autocmd BufWritePre * call TrimWhiteSpace()

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
" selecione com o mouse e use "+y para compiar
" :vmap <C-C> "+y

nnoremap <F3> :CtrlPTag<CR>
nmap <C-UP> :m-2<CR>
nmap <C-DOWN> :m+1<CR>

nmap <F5> :s/(\(.*\)\.size()\s*>\s*0/( ! \1.isEmpty() /<CR>:wq<CR>

"set colorcolumn=28,120
set colorcolumn=120

" Melhora a performance
" set cursorline
set cursorline
set cursorcolumn
set lazyredraw
set synmaxcol=200 " limite para highligh
syntax sync minlines=256


nnoremap H :set cursorline! cursorcolumn!<CR>

" Integração com psql -> \e
" veja o arquivo ~/.vim/syntax/dbout.vim
" use antes do psql
" export PAGER='vim -R -u ~/.vimrcpg -'
" https://unencumberedbyfacts.com/2016/01/04/psql-vim-happy-face/
au BufRead /tmp/psql.edit.* set syntax=sql

let spell_language_list="brasileiro,american"
let spell_auto_type="md,tex,doc,mail"

" Habilita verificação
" setlocal spell spelllang=pt_br

"let g:pandoc#spell#default_langs=["brasileiro","american"]
let g:pandoc#spell#default_langs=[]

" atalhos do spell
" ]s ............. vai para a próxima palavra
" zg ............. adiciona palavra
" zw ............. retira palavra
" z= ............. sugestões
" zug ............ contrario de zg
" zuw ............ contrario de zw

set wildignore+=*/git/opa/rel/*
set wildignore+=*/git/*/node_modules
set wildignore+=**/tmp/**

set ttyfast

set tags=tags

" Diga do livro ProGit p. 30
" I have never had an issue with corrupting files that made me wish I had Vim
" backup and store data in a swap file.
set nobackup
set nowritebackup
"set noswapfile

" Recarrega se o arquivo foi alterado em disco
set autoread
"au CursorHold * checktime " verifica um vez após 4s de inatividade no modo normal
au CursorHold,CursorHoldI * checktime " ativa quando o cursor para de mover
au FocusGained,BufEnter * :checktime " ativa quando entra no buffer


set number

"   
"   ## Melhorar a visibilidade da indentação
"   
"   Incluir `Plugin 'Yggdroot/indentLine'` no vundle.
"   Desabilitado no momento!
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

"   
"   ## Configuração do clang-format
"   
"   A configuração foi extraída para um repositório próprio.
"   
"{{{
" git clone ssh://git@intmain.io:8322/geraldoim/dot_clang_format.git ~/.clang
" ln -sf ~/.clang/clang-format ~/.clang-format

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,cxx,objc,java nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,cxx,objc,java vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,cxx,objc,java map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
"}}}

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2 "1
let g:syntastic_check_on_open = 0 "1 
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_include_dirs = ['/opt/intmain/dev/linux/usr/include/','../include/','/usr/include/c++/6','/usr/include/x86_64-linux-gnu/c++/6/']
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_compiler_options = ' -include ../src/precompile.hpp -std=c++11 -stdlib=libc++ '

" Veja os passos completos em:
" https://remarkablemark.org/blog/2016/09/28/vim-syntastic-eslint/
let g:syntastic_javascript_checkers=['eslint']

let g:syntastic_sh_checkers=['shellcheck']

" ultisnip
let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsExpandTrigger="<>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"nmap <leader><tab> call UltiSnips#ExpandSnippet()

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set path+=/opt/intmain/dev/*/usr/include/
"set path+=.,~/git/Intmain/


set encoding=UTF-8
set helplang=pt

" fundo transparente vai ser sobrescrito pelo scheme atual
" hi Normal guibg=NONE ctermbg=NONE

",**/

" https://coderwall.com/p/pupilw/pretty-format-xml-in-vim
" Formata com =
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Não funcionou o comando abaixo, pesquisar como passar o arquivo como
" parâmetro
" au FileType json setlocal equalprg=python\ -m\ json.tool\ -\ 2>/dev/null

" Analisar este site
" http://5.vim-bootstrap.appspot.com/

" Mostra 5 linhas abaixo e acima do cursor
set scrolloff=5
"   
"   ### Color scheme
"   
"{{{
set background=dark
"colorscheme eldar
"colorscheme abbott
"colorscheme wombat
"colorscheme vimtom
colorscheme molokai
"}}}
"

" Most likely you are interested in these three highlighting groups: Cursor, CursorColumn and CursorLine. The names are self explanatory.
"highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorLine ctermbg=LightBlue
"
highlight CursorColumn ctermbg=Black
highlight Cursor       ctermbg=Black cterm=bold
highlight CursorLine   ctermbg=Black cterm=bold

highlight MyFix ctermbg=darkred ctermfg=white guibg=red guifg=white
augroup HiglightMyFix
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'TODO:', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'FIXME:', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'GLSR:', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'NOTE:', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('MyFix', 'SHIT:', -1)
augroup END

" Para fundo transparente
" hi Normal ctermbg=none

" .vim/after/ftplugin/cpp.vim
"   
"   ### Atalhos de teclado
"   
"{{{
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" Alterna entre as tabs
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8

" -------------------------------------------------------------------
" Executar a linha atual
nmap <F12> :exec '!'.getline('.')<CR>
nmap <S-F12> :exec '!ssh vm01 "'.getline('.').'"'<CR>

" Salva o buffer atual
nmap <F2> :Gwrite<cr>
imap <F2> <c-o>:Gwrite<cr>

" Vai para o próximo buffer
nmap <F6> :bn<CR>
nmap <S-F6> :bp<CR>

" Vai para o próximo erro
nmap <F7> :cnext<CR>
nmap <S-F7> :cprev<CR>

" Compila
nmap <F9> :make<CR>

" Fecha o buffer atual
nmap <F8> :bp\|bd #<CR>

" Seleção de bloco no terminal do xfce que já usa o ctrl+shift+V para colar
:nnoremap <f4>  <c-v>

" Ctrl+P configurado acima
"}}}

" para mapear o mouse
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" <LeftMouse>     - Left mouse button press
" <RightMouse>    - Right mouse button press
" <MiddleMouse>   - Middle mouse button press
" <LeftRelease>   - Left mouse button release
" <RightRelease>  - Right mouse button release
" <MiddleRelease> - Middle mouse button release
" <LeftDrag>      - Mouse drag while Left mouse button is pressed
" <RightDrag>     - Mouse drag while Right mouse button is pressed
" <MiddleDrag>    - Mouse drag while Middle mouse button is pressed
" <2-LeftMouse>   - Left mouse button double-click
" <2-RightMouse>  - Right mouse button double-click
" <3-LeftMouse>   - Left mouse button triple-click
" <3-RightMouse>  - Right mouse button triple-click
" <4-LeftMouse>   - Left mouse button quadruple-click
" <4-RightMouse>  - Right mouse button quadruple-click
" <X1Mouse>       - X1 button press
" <X2Mouse>       - X2 button press
" <X1Release>     - X1 button release
" <X2Release>     - X2 button release
" <X1Drag>        - Mouse drag while X1 button is pressed
" <X2Drag>        - Mouse drag while X2 button is pressed



function! GrCppAutoDoc()
  let text = getline(1,'$')
  ":g/GR_H[12356]/z#.5|echo "======"
  ":g/GR_H[12356]/|echo "======"
  "echo "FIM"
  ":redir @a          " redireciona a saída para o registrador a
  ":g/GR_H[123456]/
  ":redir END         " finaliza o redirecionamento
  ":new               " Cria uma nova janela
  ":put! a            " Cola o conteúdo do registrador a na nova janela
  return 0
endfunction

"nnoremap <C-F12> :tabnew\|0r!grep -n  #<Left><Left>

" vim: foldmethod=marker
