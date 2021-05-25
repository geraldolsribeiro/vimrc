"   # vimrc de Geraldo Ribeiro
"   
"   [TOC]
"   
"   ## Instalação
"   
" NOTA: os comentários dentro do bloco estão deslocados para não entrar como cabeçalhos
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
"   ## Variáveis do vim e seus prefixos
"   
"   As variáveis a seguir são somente para facilitar a leitura do restante da
"   configuração. Em [devhints](https://devhints.io/vimscript) existem um bom
"   resumo das variáveis e opções.
"   
"   ```vim
"   let var = "hello"
"   let w:foo = 'bar'              " w: window
"   let b:state = 'on'             " b: buffer
"   let t:state = 'off'            " t: tab
"   let g:ack_options = '-s -H'    " g: global
"   let s:ack_program = 'ack'      " s: local (to script)
"   let l:foo = 'bar'              " l: local (to function)
"   echo v:var                     " v: vim special
"   ```
"   

set nocompatible              " be iMproved, required
filetype off                  " Necessário estar off antes do Vundle
syntax on                     " Ativa o highlight de sixntaxe
set showcmd                   " Exibe comando na última linha
set showmatch                 " Mostra os pares de parênteses
set autoindent                " Indenta com o ENTER
set clipboard=unnamedplus     " y e p copiando e colando para a área de transferência do sistema
set virtualedit=all           " permite mover o cursor para fora do texto e acrescenta espaços em caso de inserção

let mapleader="\<space>"      " leader usando barra de espaço
let maplocalleader="\<space>"

"   
"   ## Configuração específica para projetos
"   
"   O Vim permite ter um .vimrc específico para o projeto fazendo com que
"   a configuração global fique mais limpa e genérica. Basta criar
"   o arquivo de configuração no raiz do projeto e habilitar o `exrc`.
"   
"{{{
set exrc
"}}}

function! IsOnSomeParticularMachine(hostname)
  return match($HOSTNAME, a:hostname) >= 0
endfunction

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
"   
"   ### Sorround
"   
"{{{
Plugin 'tpope/vim-surround'           "FIXME: Tem um link para um tutorial no final do arquivo, converter para seção
"}}}
"   
"   ### Bookmarks
"   
"{{{
" mm Add/remove bookmark at current line           :BookmarkToggle
" mi Add/edit/remove annotation at current line    :BookmarkAnnotate <TEXT>
" mn Jump to next bookmark in buffer               :BookmarkNext
" mp Jump to previous bookmark in buffer           :BookmarkPrev
" ma Show all bookmarks (toggle)                   :BookmarkShowAll
" mc Clear bookmarks in current buffer only        :BookmarkClear
" mx Clear bookmarks in all buffers                :BookmarkClearAll
" mkk Move up bookmark at current line             :BookmarkMoveUp [<COUNT>]
" mjj Move down bookmark at current line           :BookmarkMoveDown [<COUNT>]
" mg Move bookmark at current line to another line :BookmarkMoveToLine <LINE>
" Save all bookmarks to a file                     :BookmarkSave <FILE_PATH>
" Load bookmarks from a file                       :BookmarkLoad <FILE_PATH>

Plugin 'MattesGroeger/vim-bookmarks'
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
" let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_auto_save = 1
let g:bookmark_save_per_working_dir = 0

" TIP: Incluir esta linha no .vimrc do projeto com um sufixo para separar os
" bookmarks por projeto
let g:bookmark_auto_save_file = $HOME . '/.vim/bookmarks'

" Aprender sobre signs
" :help signs
" https://vi.stackexchange.com/questions/3755/syntax-highlight-for-whole-line
" https://github.com/mhinz/vim-signify
" Plugin 'chrisbra/DynamicSigns'
"}}}
"   
"   ### Utilitários
"   
"{{{
Plugin 'powerline/powerline-fonts'
Plugin 'geraldolsribeiro/vim-conceal' " Exibição de caracteres
"Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'SirVer/ultisnips'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'dhruvasagar/vim-table-mode.git'
" Lança o ranger a partir do vim
Plugin 'francoiscabrol/ranger.vim' " <leader> f

" vimwiki está interferindo no autocomplete
" Plugin 'vimwiki/vimwiki'
"}}}
"   
"   ### Clang complete
"   
"{{{
Plugin 'xavierd/clang_complete'
" Onde a biblioteca está
let g:clang_library_path='/usr/lib/llvm-8/lib/libclang.so.1'
"}}}
"   
"   ### Tradução
"   
"{{{
Plugin 'voldikss/vim-translator'
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
"}}}
"   
"   Para definir o comentário para um novo tipo use:
"   
"   `autocmd FileType xyz set commentstring=#\ %s`
"
"   * `g<` descomenta a seleção
"   * `g>` comenta a seleção
"   * `leader_p` comenta parágrafo
"   
"   ### Markdown / Escrita
"   
"{{{
" Fork do plugin do Marcos Oliveira
Plugin 'geraldolsribeiro/vim-auto-markdown'

" npm -g install instant-markdown-d@next
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
let g:instant_markdown_browser = "firefox --new-window"
" Abrir o preview ao carregar um arquivo markdown
let g:instant_markdown_autostart = 1

Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'junegunn/vim-emoji'
"Plugin 'kyuhi/vim-emoji-complete' " FIXME: nao funciona bem com o git

Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

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
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
" Enable HTML syntax highlighting inside Dart strings with let dart_html_in_string=v:true (default false).
" Disable highlighting of core library classes with let dart_corelib_highlight=v:false (default true).
" Enable Dart style guide syntax (like 2-space indentation) with let dart_style_guide = 2
" Enable DartFmt execution on buffer save with let dart_format_on_save = 1

let g:lsc_auto_map = v:true
" The default keymaps of vim-lsc are:
" 'GoToDefinition': <C-]>,
" 'GoToDefinitionSplit': [<C-W>], <C-W><C-]>],
" 'FindReferences': gr,
" 'NextReference': <C-n>,
" 'PreviousReference': <C-p>,
" 'FindImplementations': gI,
" 'FindCodeActions': ga,
" 'Rename': gR,
" 'DocumentSymbol': go,
" 'WorkspaceSymbol': gS,
" 'SignatureHelp': gm,

Plugin 'thosakwe/vim-flutter'
" https://github.com/thosakwe/vim-flutter
"
" :FlutterRun <args> - calls flutter run <args>
" :FlutterHotReload - triggers a hot reload on the current Flutter process
" :FlutterHotRestart - triggers a hot restart on the current Flutter process
" :FlutterQuit - quits the current Flutter process
" :FlutterDevices - opens a new buffer, and writes the output of flutter devices to it
" :FlutterSplit - opens Flutter output in a horizontal split
" :FlutterEmulators - Executes a flutter emulators process.
" :FlutterEmulatorsLaunch - Executes a flutter emulators --launch process, with any provided arguments.
" :FlutterVisualDebug - Toggles visual debugging in the running Flutter process.
" The following are self-explanatory:
"
" :FlutterVSplit
" :FlutterTab

"}}}
"   
"   ### HTML
"   
"{{{
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'dNitro/vim-pug-complete'

" Esta linha deveria ser lida do vim-pug
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

"}}}
   
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
"Plugin 'vim-erlang/vim-erlang-omnicomplete'
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
"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'junegunn/limelight.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'romainl/Apprentice'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'daylerees/colour-schemes'
Plugin 'effkay/argonaut.vim'
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
Plugin 'preservim/nerdtree'
"let g:NERDTreeDirArrows=0 " Não mostrar símbolos na lateral dos nomes
" Improves performance of the SyntaxHighlighting and removes the lag
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'hpp', 'py', 'md', 'txt', 'java', 'sh', 'vim', 'json']
"}}}
"FIXME: O dolar está quebrando a documentação
let g:NERDTreeIgnore = ['\.o$', '\.pyc$', '\~$', '\.gif', '\.jpg', '\.png']
"{{{
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
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeNodeDelimiter="😀"

" Abre automaticamente a tree se não for passado nenhum arquivo
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Abre automaticamente a tree se for passado um diretório como argumento
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Fecha o vim se a única janela aberta for a do nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
"   
"   ## Auto completar
"   
"{{{
Plugin 'neoclide/coc.nvim'
" coc.nvim works best on vim >= 8.1.1719 and neovim >= 0.4.0, consider upgrade your vim.
let g:coc_disable_startup_warning = 1
"}}}
"   
"   ## Configuração geral
"   
"{{{
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
"}}}
"   
"   ## Git
"   
"{{{
Plugin 'airblade/vim-gitgutter'
" Comandos:
" [c          anterior
" ]c          próximo
" <leader>hp  preview
" <leader>hs  stage
" <leader>hu  undo

" Emoji
" if emoji#available()
"  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"  let g:gitgutter_sign_modified_removed = emoji#for('collision')
" endif

"let g:gitgutter_sign_added = '+ '
"let g:gitgutter_sign_modified = '~ '
"let g:gitgutter_sign_removed = '- '
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

" Ignorar espaços em branco
"let g:gitgutter_diff_args = '-w'
"FIXME: resumir a documentação do gitgutter aqui
"}}}
"   
Plugin 'chrisbra/Colorizer'  " Exibe cores #fff
let g:colorizer_auto_filetype='css,html,scss'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

Plugin 'mg979/vim-visual-multi'
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

" Plantuml
Plugin 'aklt/plantuml-syntax'
Plugin 'scrooloose/vim-slumlord'

" FIXME: Separar os plugins abaixo
"
"Bundle 'aming/vim-mason'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-abolish'


Plugin 'rhysd/vim-gfm-syntax'
let g:markdown_fenced_languages = ['vim', 'cpp', 'ruby', 'json']
let g:gfm_syntax_enable_always = 1
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']

" Formatação de código
Plugin 'rhysd/vim-clang-format'

" Plugin 'justmao945/vim-clang'


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

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'



let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined", "-g"]


if has("gui_running")
  if IsOnSomeParticularMachine('cff39b5fb46d')
    set guifont=Monospace\ Regular\ 14
  elseif has("gui_gtk3" )
    set guifont=Fira\ Code\ 14
    "set guifont=Droid_Sans_Mono_Nerd_Font_Complete.otf\ 14
  elseif has("gui_gtk2")
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
let g:netrw_banner       = 0
let g:netrw_liststyle    = 3 " tree
let g:netrw_browse_split = 4 " Mantem a arvore aberta
let g:netrw_altv         = 1
let g:netrw_winsize      = 20 " percentua da janela usado para a listagem

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

augroup java
  au!
  "au BufRead,BufNewFile *.jet setf jet
  au BufRead,BufNewFile *.jet setf cpp " acrescentei regions no after/syntax/cpp.vim
augroup END

" Neocomplete Settings
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 0
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3


" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" gg vai para o topo, = indenta até ... G (fim)
" autocmd BufWritePre *.scss :normal gg=G

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

" histórico de comandos executados
set history=1000

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

set complete+=kspell
set completeopt=longest,menuone
set formatoptions=tcqrn1
set matchpairs+=<:> " Use % to jump between pairs
set maxmempattern=5000 " default 1000
set wildmenu
set wildmode=full
set wrap

" Remove algumas mensagens da barra status ao rolar na seleção do complete
set shortmess+=c

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

let g:slumlord_plantuml_jar_path = "/usr/share/plantuml/plantuml.jar"
let g:slumlord_plantuml_include_path = "~/.config/plantuml/include/"
let g:slumlord_separate_win = 1
let g:slumlord_asciiart_utf = 1

" Use ack instead of grep
set grepprg=ack

" Ignora maiúscula/minúscula na pesquisa
set ignorecase
" Realiza a pesquisa enquando é digitada
set incsearch

"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" sempre exibe a barra de status
set laststatus=2

" Exibe o nome do arquivo que está sendo editado na janela
set title
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
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" let g:ctrlp_working_path_mode = 'ra'
" Busca por nome de arquivo em vez do path completo
let g:ctrlp_by_filename = 1



" Usar Ctrl+X Ctrl+U
set completefunc=emoji#complete

set mousemodel=extend
set mouse+=a
" selecione com o mouse e use "+y para compiar
" :vmap <C-C> "+y

nnoremap <F3> :CtrlPTag<CR>

" Move linha para cima
nmap <C-UP> :m-2<CR>
" Move linha para baixo
nmap <C-DOWN> :m+1<CR>

nmap <F5> :s/(\(.*\)\.size()\s*>\s*0/( ! \1.isEmpty() /<CR>:wq<CR>

" muda a indentação de um bloco visual
vnoremap < <gv
vnoremap > >gv

"set colorcolumn=28,120
set colorcolumn=80,120

set cursorline
set cursorcolumn
set lazyredraw
set synmaxcol=200 " limite para highligh
syntax sync minlines=256

" Liga/desliga o cursor
nnoremap H :set cursorline! cursorcolumn!<CR>


" Em 'bundle/vim-gfm-syntax/autoload/gfm_syntax/emoji.vim' tem um for para
" Em 'bundle/vim-conceal/after/syntax/cpp.vim' tem algumas substituições
" [ '":x:"', '❌' ] 
" [ '":white_check_mark:"', '✅' ],
" configurar
" ☒ u2612
" ☐ u2610
" ✖ u2716
" ✗ u2717
" ✘ u2718
" ✕ u2715
" U2326 ⌦
" U2327 ⌧
" U232B ⌫
" U2302 ⌂
" U2310 ⌐
" U23CE ⏎
" U2192 →
" U2206 ∆
" U221A √
" U221E ∞
" U2211 ∑
" U222B ∫
" U2202 ∂
" U2260 ≠
" U2264 ≤
" U2265 ≥
" U2209 ∩
" U2610 ☐
" U2611 ☑
" U2612 ☒
" U2713 ✓
" U27A1 ➡
" U2573 ╳
" U27E8 ⟨
" U27E9 ⟩
command Checkmark2 :execute "normal i<C-v>u2713 " |" ✓
command Checkmark  :execute "normal i<C-v>u2714 " |" ✔

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
set noswapfile

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

" set statusline=%t      " final do nome do arquivo
" set statusline+=%{&ff} " formato do arquivo
" set statusline+=%h     " help file flag
" set statusline+=%m     " modified flag
" set statusline+=%r     " read only flag
" set statusline+=%y     " tipo do arquivo
" set statusline+=%c     " coluna do cursor
" set statusline+=%l/%L  " linha do cursor/total de linhas
" set statusline+=\ %P   " percentual do arquivo

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2 " sugerido pela documentação: 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler = 'gcc'
" FIXME: Verificar se os path abaixo estão atualizados e contemplam o clang
let g:syntastic_cpp_include_dirs = ['/opt/intmain/dev/linux/usr/include/','../include/','/usr/include/c++/6','/usr/include/x86_64-linux-gnu/c++/6/']
let g:syntastic_cpp_compiler_options = ' -include ../src/precompile.hpp -std=c++17 -stdlib=libc++ '
let g:syntastic_cpp_checkers=['gcc', 'cppcheck', 'flawfinder', 'clang_tidy']
let g:syntastic_cpp_clang_tidy_post_args = " -I../include"

let g:syntastic_filetype_map = { 'mkd': 'markdown' }

" https://vimawesome.com/plugin/vim-clang
" let g:clang_c_options = '-std=gnu14'
" let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'

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

" Mínimo de colunas para rolar horizontalmente
set sidescroll=1

" Mostra 15 caracteres a direita e esquerda do cursor
set sidescrolloff=15

" Quebra em pontos convenientes em vez de no meio das palavras
set linebreak

"   
"   ### Tradução
"   
"{{{
let g:translator_target_lang='pt'
let g:translator_source_lang='auto'
"}}}
"   
"   ### Color scheme
"   
"{{{
set background=dark
"set background=light
"colorscheme eldar
"colorscheme abbott
"colorscheme wombat
"colorscheme vimtom
"colorscheme solarized
"colorscheme dracula
colorscheme molokai
colorscheme gruvbox

" Força fundo transparente sobre o esquema de cores atual
" hi Normal guibg=NONE ctermbg=NONE
"
"let g:solarized_termcolors=16
"let g:solarized_termtrans = 1

"}}}
"

" Most likely you are interested in these three highlighting groups: Cursor, CursorColumn and CursorLine. The names are self explanatory.
"highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorLine ctermbg=LightBlue
"
"highlight CursorColumn ctermbg=Gray
"highlight Cursor       ctermbg=Gray cterm=bold
"highlight CursorLine   ctermbg=Gray cterm=bold
"highlight Cursor  ctermbg=black ctermfg=white  guifg=white guibg=black
"highlight iCursor ctermbg=blue ctermfg=white guifg=white guibg=steelblue

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


" https://stackoverflow.com/questions/22407035/using-vim-as-a-c11-ide/22407453#22407453
"nmap <leader>0 :exec '!clang-modernize -style=Google -format -loop-convert -pass-by-value -replace-auto_ptr -use-nullptr -use-auto -add-override -override-macros '.expand('%:p:h')<CR>
"nmap <leader>0 :exec '!echo xyz '.expand('%:p:h')<CR>

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

nmap <leader>h :e /opt/intmain/dev/linux/usr/share/Gr/scripts/Common/Makefile.include<CR>

"   ## Destaque para as seções deste arquivo
"   
"   As sintaxes podem ser extendidas usado a pasta `after/syntax`, p.e.
"   `after/syntax/make.vim`
"{{{
highlight intmain_docmd ctermbg=green ctermfg=white
match intmain_docmd /"\(   \|{{{\|}}}\).*/
"}}}

command MeuComando echo "Olá mundo!"

function MinhaFuncao()
  echo "Minha função"
endfunction

command MinhaFuncao :call MinhaFuncao()
"-      comando           função
"
" ----------------------------------------
" https://www.reddit.com/r/vim/comments/cbgnol/live_reload_for_vimweb_development/
"~/bin/refresh
"#!/bin/sh
"# switch to Firefox and refresh the active tab
"xdotool search --name "Mozilla Firefox" windowactivate --sync
"sleep 0.5
"xdotool key ctrl+r
"Then, in my vimrc:

" write and refresh in browser
map ww<cr> w<cr> :silent! !~/bin/refresh_chrome<cr>
"cmap ww<cr> w<cr> :silent! !~/bin/refresh_firefox<cr>
"
" npm install -g browser-sync
"
" function! ReloadBrowser()
"     silent exe "!osascript -e 'tell app \"Firefox\" to activate\<cr>
"             \tell app \"System events\"\<cr> keystroke \"r\" using command down\<cr>
"             \end tell'"
"     silent exe "!osascript -e 'tell app \"Iterm2\" to activate'"
" endfunction
"
" let s:auto_reload = v:false
"
" function! ToggleAutoReload()
"     if s:auto_reload
"         augroup AutoReload
"             au!
"             autocmd BufWritePost *.filetype call ReloadBrowser()
"         augroup END
"     else
"         augroup AutoReload
"             au!
"         augroup END
"     endif
"     let s:auto_reload = !s:auto_reload
" endfunction
"
" ----------------------------------------

" Vim Scripting
"
" :help vim-script-intro
" :help usr_41.txt
" :help function
" :help function-list
" :help keycodes
" :help autocmd-events
" :help autocmd-events-abc
"
"
" :nmap ;s :source /full/path/to/the/scriptfile.vim<CR>
" :nmap \b :call MyBackupFunc(expand('%'), { 'all': 1 })<CR>
"
" Artigos para olhar com calma no futuro
"
" https://thevaluable.dev/vim-advanced/
" https://thevaluable.dev/vim-search-find-replace/

" Reler este artigo
" https://developer.ibm.com/technologies/linux/articles/l-vim-script-1/
" https://developer.ibm.com/articles/l-vim-script-1/
" https://developer.ibm.com/tutorials/l-vim-script-2/
" https://medium.com/weekly-webtips/vim-neovim-silverlight-ctags-make-up-an-awesome-editor-49f3980b575d
" Exemplo
function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

nmap <silent>  ;s  :call ToggleSyntax()<CR>

" https://vim.fandom.com/wiki/C%2B%2B_code_completion
map <F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" ## Defining command line commands
" 
" Vim enables you to define your own commands. You execute these commands just
" like other command-line mode command. To define a command use :command command
" as follows:
" 
" :command CmdName execute_me
" 
" Now when you execute the command :CmdName, Vim executes :execute_me.
" 
" To list the user-defined commands, execute the following command:
" 
" :command
" 
" User-defined commands can take a series of arguments. The number of arguments
" must be specified by the -nargs option. For instance, the example :CmdName
" command takes no arguments, so you could have defined it as:
" 
" :command CmdName -nargs=0 CmdName execute_me
" 
" However, because zero arguments is the default, you do not need to add
" -nargs=0. The other values of -nargs are as follows:
" 
" -nargs=0: No arguments
" -nargs=1: One argument
" -nargs=*: Any number of arguments
" -nargs=?: Zero or one argument
" -nargs=+: One or more arguments
" 
" To redefine the same command, use the ! argument:
" 
" :command -nargs=+ Say :echo <args>
" 
" :command! -nargs=+ Say :echo <q-args>
" 
" To delete all the user commands:
" 
" :comclear

" FIXME: É possível criar comandos para automatizar o sorround
" http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/
"

" FIXME: Criar uma seção sobre conceal
"https://alok.github.io/2018/04/26/using-vim-s-conceal-to-make-languages-more-tolerable/#:~:text=Vim%20(and%20Emacs)%20have%20features,line%2C%20the%20conceal%20goes%20away.&text=It's%20really%20easy%20to%20abuse,but%20you%2C%20unlike%20code%20formatting.
" https://github.com/pangloss/vim-javascript
"

" Destaca os caracteres não ASCII
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" Executa o comando google passando a palavra sob o cursor quando for
" pressionado K
set keywordprg=google
" comporamento default
set keywordprg=man\ -s
" vim: foldmethod=marker foldmarker={{{,}}} spell spelllang=pt_br :
