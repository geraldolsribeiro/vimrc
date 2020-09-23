[//]: <> (Documentação gerada com intmain_docmd)
# vimrc de Geraldo Ribeiro

## Sumário

* [vimrc de Geraldo Ribeiro](#vimrc-de-geraldo-ribeiro)
  * [Instalação](#instalação)
  * [Atualização](#atualização)
  * [Outras dependências](#outras-dependências)
  * [Variáveis do vim e seus prefixos](#variáveis-do-vim-e-seus-prefixos)
  * [Plugins](#plugins)
      * [FZF](#fzf)
      * [Cucumber](#cucumber)
      * [Servidores web](#servidores-web)
      * [Utilitários](#utilitários)
      * [Plugins genéricos para programação](#plugins-genéricos-para-programação)
      * [Comentários](#comentários)
      * [Markdown / Escrita](#markdown-/-escrita)
      * [Git Support](#git-support)
      * [Dart](#dart)
      * [C++](#c++)
      * [Erlang Support](#erlang-support)
      * [Elixir Support ](#elixir-support-)
      * [Theme / Interface / Color Scheme](#theme-/-interface-/-color-scheme)
      * [Devicons](#devicons)
      * [Nerdtree](#nerdtree)
      * [TOML](#toml)
      * [Typescript](#typescript)
      * [Typescript](#typescript)
      * [Dark powered neo-completion](#dark-powered-neo-completion)
  * [Metatrader](#metatrader)
  * [Configuração geral](#configuração-geral)
  * [Configuração do neomake](#configuração-do-neomake)
      * [Coffeescript](#coffeescript)
      * [Elixir](#elixir)
      * [Java](#java)
      * [ruby ](#ruby-)
      * [SCSS](#scss)
      * [vim-table-mode](#vim-table-mode)
  * [Melhorar a visibilidade da indentação](#melhorar-a-visibilidade-da-indentação)
  * [Configuração do clang-format](#configuração-do-clang-format)
      * [Color scheme](#color-scheme)
      * [Atalhos de teclado](#atalhos-de-teclado)


## Instalação

```bash
 # Clona o repositório da intmain
git clone ssh://git@intmain.io:8322/geraldoim/dot_vim.git ~/.vim
 # ou do github
git clone https://github.com/geraldolsribeiro/vimrc.git ~/.vim

 # Aponta o arquivo de configuração para a configuração personalizada
ln -s ~/.vim/vimrc .vimrc

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


### Cucumber


```vim
Plugin 'tpope/vim-cucumber.git'
```


### Servidores web


```vim
Plugin 'chr4/nginx.vim'
```

### Utilitários


```vim
Plugin 'powerline/powerline-fonts'
"Plugin 'geraldolsribeiro/vim-conceal'
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
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'dhruvasagar/vim-table-mode.git'
" Lança o ranger a partir do vim
Plugin 'francoiscabrol/ranger.vim'
```


### Plugins genéricos para programação


```vim
"Plugin 'jakedouglas/exuberant-ctags'
Plugin 'honza/vim-snippets'
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
```


Para definir o comentário para um novo tipo use:

`autocmd FileType xyz set commentstring=#\ %s`
* `g<` descomenta a seleção
* `g>` comenta a seleção
* `leader_p` comenta parágrafo

### Markdown / Escrita


```vim
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


### C++


```vim
" This file contains additional syntax highlighting that I use for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
```


### Erlang Support


```vim
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
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
```


### Nerdtree


```vim
Plugin 'scrooloose/nerdtree'
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
```

## Configuração geral


```vim
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
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


### Color scheme


```vim
set background=dark
"set background=light
"colorscheme eldar
"colorscheme abbott
"colorscheme wombat
"colorscheme vimtom
colorscheme molokai
```


### Atalhos de teclado


```vim
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
```

