[//]: <> (Documentação gerada com intmain_docmd)
Fonte: `vimrc`

# vimrc de Geraldo Ribeiro

## Sumário

* [vimrc de Geraldo Ribeiro](#vimrc-de-geraldo-ribeiro)
  * [Instalação](#instalação)
  * [Atualização](#atualização)
  * [Outras dependências](#outras-dependências)
  * [Variáveis do vim e seus prefixos](#variáveis-do-vim-e-seus-prefixos)
  * [Configuração específica para projetos](#configuração-específica-para-projetos)
  * [Plugins](#plugins)
      * [FZF](#fzf)
      * [Blockdiag](#blockdiag)
      * [Cucumber](#cucumber)
      * [Servidores web](#servidores-web)
      * [Sorround](#sorround)
      * [Bookmarks](#bookmarks)
      * [Utilitários](#utilitários)
      * [Clang complete](#clang-complete)
      * [Snippets](#snippets)
      * [Tradução](#tradução)
      * [Plugins genéricos para programação](#plugins-genéricos-para-programação)
      * [Comentários](#comentários)
      * [Markdown / Escrita](#markdown-/-escrita)
      * [Git Support](#git-support)
      * [Dart](#dart)
      * [HTML](#html)
      * [C++](#c++)
      * [Erlang Support](#erlang-support)
      * [Elixir Support ](#elixir-support-)
      * [Theme / Interface / Color Scheme](#theme-/-interface-/-color-scheme)
      * [Nerdtree](#nerdtree)
      * [TOML](#toml)
      * [Typescript](#typescript)
      * [Typescript](#typescript)
      * [Dark powered neo-completion](#dark-powered-neo-completion)
  * [Metatrader](#metatrader)
  * [Auto completar](#auto-completar)
      * [COC - Conquer Of Completion](#coc---conquer-of-completion)
      * [YouCompleteMe](#youcompleteme)
  * [Clangd](#clangd)
  * [Configuração geral](#configuração-geral)
  * [Git](#git)
  * [Configuração do neomake](#configuração-do-neomake)
      * [Coffeescript](#coffeescript)
      * [Elixir](#elixir)
      * [Java](#java)
      * [ruby ](#ruby-)
      * [SCSS](#scss)
      * [vim-table-mode](#vim-table-mode)
      * [Devicons](#devicons)
  * [Melhorar a visibilidade da indentação](#melhorar-a-visibilidade-da-indentação)
  * [Configuração do clang-format](#configuração-do-clang-format)
      * [Tradução](#tradução)
      * [Color scheme](#color-scheme)
      * [Atalhos de teclado](#atalhos-de-teclado)
  * [Destaque para as seções deste arquivo](#destaque-para-as-seções-deste-arquivo)

[TOC]

## Instalação

```bash
 # Clona o repositório da intmain
git clone ssh://git@intmain.io:8322/geraldoim/dot_vim.git ~/.vim
 # ou do github
git clone https://github.com/geraldolsribeiro/vimrc.git ~/.vim

 # Aponta o arquivo de configuração para a configuração personalizada
ln -s ~/.vim/vimrc ~/.vimrc

 # Baixa todos os plugins relacionados na configuração
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
```

## Atualização

Para atualizar os plugins utilize o comando abaixo

```bash
vim +VundleUpdate +qall
```

## Outras dependências

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Variáveis do vim e seus prefixos

As variáveis a seguir são somente para facilitar a leitura do restante da
configuração. Em [devhints](https://devhints.io/vimscript) existem um bom
resumo das variáveis e opções.

```vim
let var = "hello"
let w:foo = 'bar'              " w: window
let b:state = 'on'             " b: buffer
let t:state = 'off'            " t: tab
let g:ack_options = '-s -H'    " g: global
let s:ack_program = 'ack'      " s: local (to script)
let l:foo = 'bar'              " l: local (to function)
echo v:var                     " v: vim special
```


## Configuração específica para projetos

O Vim permite ter um .vimrc específico para o projeto fazendo com que
a configuração global fique mais limpa e genérica. Basta criar
o arquivo de configuração no raiz do projeto e habilitar o `exrc`.


```vim
set exrc
```


## Plugins

Configura o path de inclusão do `Vundle` e o inicia.


```vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
```


### FZF


```vim
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
```


### Blockdiag


```vim
Plugin 'mhaig/vim-blockdiag-series.git'
" Veja orientação em https://github.com/mhaig/vim-blockdiag-series sobre
" alteração no .vim/scripts.vim
```


### Cucumber


```vim
Plugin 'tpope/vim-cucumber.git'
```


### Servidores web


```vim
Plugin 'chr4/nginx.vim'
```


### Sorround


```vim
Plugin 'tpope/vim-surround'           "FIXME: Tem um link para um tutorial no final do arquivo, converter para seção
" let g:surround_{char2nr('o')} = "**\r**"
```


### Bookmarks


```vim
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
```


### Utilitários


```vim
Plugin 'powerline/powerline-fonts'
Plugin 'geraldolsribeiro/vim-conceal' " Exibição de caracteres
"Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'

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
" Plugin 'tools-life/taskwiki'
```


### Clang complete


```vim
Plugin 'xavierd/clang_complete'
" Onde a biblioteca está
if filereadable('/usr/lib/llvm-11/lib/libclang.so.1')
  let g:clang_library_path='/usr/lib/llvm-11/lib/libclang.so.1'
else
  let g:clang_library_path='/usr/lib/llvm-8/lib/libclang.so.1'
endif
```


### Snippets


```vim
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'garbas/vim-snipmate'

let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsExpandTrigger="<>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"nmap <leader><tab> call UltiSnips#ExpandSnippet()

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

```


### Tradução


```vim
Plugin 'voldikss/vim-translator'
```


### Plugins genéricos para programação


```vim
"Plugin 'jakedouglas/exuberant-ctags'
Plugin 'Townk/vim-autoclose'
Plugin 'tobyS/vmustache'
Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'
```


### Comentários


```vim
Plugin 'tomtom/tcomment_vim'

" gcc comenta/descomenta a linha atual
" gc{motion} comenta/descomenta a seleção
  <Leader>__       :: :TComment
"     <Leader>__       :: :TComment
  <Leader>_p       :: Comment the current inner paragraph
"     <Leader>_p       :: Comment the current inner paragraph
  <Leader>_<space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"     <Leader>_<space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
  <Leader>_i       :: :TCommentInline
"     <Leader>_i       :: :TCommentInline
  <Leader>_r       :: :TCommentRight
"     <Leader>_r       :: :TCommentRight
  <Leader>_b       :: :TCommentBlock
"     <Leader>_b       :: :TCommentBlock
  <Leader>_a       :: :TCommentAs <QUERY COMMENT TYPE>
"     <Leader>_a       :: :TCommentAs <QUERY COMMENT TYPE>
  <Leader>_n       :: :TCommentAs &filetype <QUERY COUNT>
"     <Leader>_n       :: :TCommentAs &filetype <QUERY COUNT>
  <Leader>_s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"     <Leader>_s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"
" ... and for select mode:
"
    " <Leader>__       :: :TComment
    " <Leader>_i       :: :TCommentInline

```


Para definir o comentário para um novo tipo use:

`autocmd FileType xyz set commentstring=#\ %s`
* `g<` descomenta a seleção
* `g>` comenta a seleção
* `leader_p` comenta parágrafo

### Markdown / Escrita


```vim
" Fork do plugin do Marcos Oliveira
Plugin 'geraldolsribeiro/vim-auto-markdown'

" Para usar o instant-markdown é necessário instalar o pacote npm antes
" npm -g install instant-markdown-d@next
Plugin 'instant-markdown/vim-instant-markdown'

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
```


### Git Support


```vim
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'   " lerda muito
```


### Dart


```vim
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

```


### HTML


```vim
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'dNitro/vim-pug-complete'

" Esta linha deveria ser lida do vim-pug
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

```

### C++


```vim
" This file contains additional syntax highlighting that I use for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
```


### Erlang Support


```vim
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-runtime'
"Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-compiler'
```


### Elixir Support 


```vim
Plugin 'elixir-lang/vim-elixir'
Plugin 'avdgaag/vim-phoenix'
Plugin 'mmorearty/elixir-ctags'
Plugin 'mattreduce/vim-mix'
Plugin 'BjRo/vim-extest'
Plugin 'frost/vim-eh-docs'
Plugin 'slashmili/alchemist.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jadercorrea/elixir_generator.vim'
```


### Theme / Interface / Color Scheme


```vim
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

```


### Nerdtree


```vim
Plugin 'preservim/nerdtree'
"let g:NERDTreeDirArrows=0 " Não mostrar símbolos na lateral dos nomes
" Improves performance of the SyntaxHighlighting and removes the lag
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'hpp', 'py', 'md', 'txt', 'java', 'sh', 'vim', 'json']
```


```vim
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

" Atalhos do NERDTree
" o   Open in previous window
" g o Preview
" t   Open in new tab
" T   Open in tab silently
" i   Open split
" g i Preview split
" s   Open VSplit
" g s Preview Split

```


### TOML


```vim
Plugin 'cespare/vim-toml'
```


### Typescript


```vim
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim.git'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

autocmd BufNewFile,BufRead *.ts set syntax=typescript
```


### Typescript


```vim
Plugin 'shinglyu/vim-codespell'
:autocmd BufWritePre *.java :Codespell
```


### Dark powered neo-completion


```vim

"if has('nvim')
"  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plugin 'Shougo/deoplete.nvim'
"  Plugin 'roxma/nvim-yarp'
"  Plugin 'roxma/vim-hug-neovim-rpc'
"endif 

"let g:deoplete#enable_at_startup = 1
```


## Metatrader


```vim
Plugin 'rupurt/vim-mql5'
"Plugin 'https://github.com/rupurt/vim-mql5'
```


## Auto completar

### COC - Conquer Of Completion

A [integração](https://github.com/neoclide/coc-tabnine) é feita através do
comando:

:CocInstall coc-tabnine


:CocInstall coc-json
:CocInstall coc-html
:CocInstall coc-css
:CocInstall coc-tsserver
:CocConfig
:CocCommand clangd.install


```vim
Plugin 'neoclide/coc.nvim'

" :CocInstall coc-tsserver coc-json coc-html coc-css coc-clangd
" ou
" vim -c 'CocInstall -sync coc-json coc-html coc-css coc-clangd
" coc-clang-format-style-options coc-cmake coc-diagnostic coc-dot-complete
" coc-htmlhint coc-markdownlint coc-ltex coc-nginx coc-sh coc-yaml|q'
"
" :CocList extensions
"
" coc.nvim works best on vim >= 8.1.1719 and neovim >= 0.4.0, consider upgrade your vim.
" let g:coc_disable_startup_warning = 1
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" a linha abaixo gera erro
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
```


### YouCompleteMe
apt install vim-youcompleteme
vim-addon-manager install youcompleteme

Instalar as dependências antes
apt install gcc g++ cmake make build-essential vim-nox python3-dev
cd .vim/plugged/YouCompleteMe/
python3 install.py --clangd-completer # Somente C/C++
python3 install.py --all # precisa do Go e NPM:
sudo apt install golang npm

```vim
" Plugin 'ycm-core/YouCompleteMe'
```


## Clangd

https://clangd.llvm.org/installation

```vim
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd-11")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = "/usr/lib/ycmd/ycm_extra_conf.py"

" https://clangd.llvm.org/installation

```

## Configuração geral


```vim
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
```


## Git


```vim
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
```



## Configuração do neomake


```vim
let g:neomake_open_list = 2
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/neomake_error.log'
let g:neomake_highlight_columns=1
```


### Coffeescript


```vim
npm install -g coffeelint
"   npm install -g coffeelint
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffeelint.json"
```


### Elixir


```vim
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
```


### Java


```vim

```


### ruby 


```vim

```


### SCSS


```vim
let g:neomake_scss_enabled_markers = ['scss-lint']
```


### vim-table-mode


```vim
" tabelas em formato markdown
let g:table_mode_corner='|'
```


### Devicons


```vim
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
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js']     = 'ƛ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['java']   = '☕'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['coffee'] = '☕'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh']     = '🐚'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cpp']    = '🗡️'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['hpp']    = '🗡️'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue']    = '﵂'

" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol   = '📝' " quando não tem símbolo definido
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁' " pasta fechada
" let g:DevIconsDefaultFolderOpenSymbol                    = '📂' " pasta aberta

let g:WebDevIconsOS = 'Darwin'

" help devicons


" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt


" After a re-source fixes the bug with the [] around devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
```


## Melhorar a visibilidade da indentação

Incluir `Plugin 'Yggdroot/indentLine'` no vundle.
Desabilitado no momento!

```vim
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_setConceal = 0
```


## Configuração do clang-format

A configuração foi extraída para um repositório próprio.


```vim
" git clone ssh://git@intmain.io:8322/geraldoim/dot_clang_format.git ~/.clang
" ln -sf ~/.clang/clang-format ~/.clang-format

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,cxx,objc,java nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,cxx,objc,java vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,cxx,objc,java map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
```


### Tradução


```vim
let g:translator_target_lang='pt'
let g:translator_source_lang='auto'
```


### Color scheme


```vim
set background=dark
" set background=light
colorscheme gruvbox

" Força fundo transparente sobre o esquema de cores atual
" Útil para deixar o vim sobreposto a outra tela no terminal
" hi Normal guibg=NONE ctermbg=NONE
hi Normal ctermbg=NONE
"
"let g:solarized_termcolors=16
"let g:solarized_termtrans = 1

```


### Atalhos de teclado


```vim
map <leader>n :NERDTreeToggle<CR>
"map <C-m> :TagbarToggle<CR>

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

" Mastering Vim Quickly #33
" map <F2> :!git shortlog -s -n %<cr>

" https://stackoverflow.com/questions/22407035/using-vim-as-a-c11-ide/22407453#22407453
"nmap <leader>0 :exec '!clang-modernize -style=Google -format -loop-convert -pass-by-value -replace-auto_ptr -use-nullptr -use-auto -add-override -override-macros '.expand('%:p:h')<CR>
"nmap <leader>0 :exec '!echo xyz '.expand('%:p:h')<CR>

" Ctrl+P configurado acima
```


## Destaque para as seções deste arquivo

As sintaxes podem ser extendidas usado a pasta `after/syntax`, p.e.
`after/syntax/make.vim`

Para testar as cores use `:runtime syntax/colortest.vim`


```vim
" Coloração comum a todas as extenções
highlight intmain_docmd ctermbg=lightgreen ctermfg=black
highlight intmain_docmd_h1 ctermbg=blue ctermfg=black
highlight intmain_docmd_h2 ctermbg=lightblue ctermfg=black
highlight intmain_docmd_h3 ctermbg=cyan ctermfg=black
highlight intmain_docmd_blank ctermbg=darkgray ctermfg=black
```

  silent exe "!osascript -e 'tell app \"Firefox\" to activate\<cr>
          \tell app \"System events\"\<cr> keystroke \"r\" using command down\<cr>
          \end tell'"
  silent exe "!osascript -e 'tell app \"Iterm2\" to activate'"
  if s:auto_reload
      augroup AutoReload
          au!
          autocmd BufWritePost *.filetype call ReloadBrowser()
      augroup END
  else
      augroup AutoReload
          au!
      augroup END
  endif
  let s:auto_reload = !s:auto_reload
