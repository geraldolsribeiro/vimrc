[//]: <> (Documentação gerada com intmain_docmd)
# vimrc: Arquivo de configuração do vim do Geraldo Ribeiro

## Sumário

* [vimrc: Arquivo de configuração do vim do Geraldo Ribeiro](#vimrc:-arquivo-de-configuração-do-vim-do-geraldo-ribeiro)
  * [Instalação](#instalação)
* [Clona o repositório](#clona-o-repositório)
* [Aponta o arquivo de configuração para a configuração personalizada](#aponta-o-arquivo-de-configuração-para-a-configuração-personalizada)
* [Baixa todos os plugins relacionados na configuração](#baixa-todos-os-plugins-relacionados-na-configuração)
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
      * [TOML](#toml)
      * [Typescript](#typescript)
      * [Dark powered neo-completion](#dark-powered-neo-completion)
  * [Configuração geral](#configuração-geral)
  * [Configuração do neomake](#configuração-do-neomake)
      * [Coffeescript](#coffeescript)
      * [Elixir](#elixir)
      * [ruby ](#ruby-)
      * [SCSS](#scss)
      * [vim-table-mode](#vim-table-mode)
  * [Melhorar a visibilidade da indentação](#melhorar-a-visibilidade-da-indentação)
  * [Configuração do clang-format](#configuração-do-clang-format)
      * [Color scheme](#color-scheme)
      * [Atalhos de teclado](#atalhos-de-teclado)


## Instalação
```bash
# Clona o repositório
git clone ssh://git@intmain.io:8322/geraldoim/dot_vim.git ~/.vim

# Aponta o arquivo de configuração para a configuração personalizada
ln -s ~/.vim/vimrc .vimrc

# Baixa todos os plugins relacionados na configuração
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
```
## Plugins
Configura o path de inclusão do `Vundle` e o inicia.
<details>
<summary>Detalhes</summary>
<p>

```vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
```

</p>
</details>
### FZF
<details>
<summary>Detalhes</summary>
<p>

```vim
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
```

</p>
</details>
### Cucumber
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'tpope/vim-cucumber.git'
```

</p>
</details>
### Servidores web
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'chr4/nginx.vim'
```

</p>
</details>
### Utilitários
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'powerline/powerline-fonts'
"Plugin 'geraldolsribeiro/vim-conceal'
"Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
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
```

</p>
</details>
### Plugins genéricos para programação
<details>
<summary>Detalhes</summary>
<p>

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

</p>
</details>
### Comentários
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'tomtom/tcomment_vim'
Para definir o comentário para um novo tipo use:
"   Para definir o comentário para um novo tipo use:

"   
```
"   ```
autocmd FileType xyz set commentstring=#\ %s
"   autocmd FileType xyz set commentstring=#\ %s
```
"   ```
"
* `g<` descomenta a seleção
"   * `g<` descomenta a seleção
* `g>` comenta a seleção
"   * `g>` comenta a seleção
* `leader_p` comenta parágrafo
"   * `leader_p` comenta parágrafo
```

</p>
</details>
### Markdown / Escrita
<details>
<summary>Detalhes</summary>
<p>

```vim
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
```

</p>
</details>
### Git Support
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'   " lerda muito
```

</p>
</details>
### Dart
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'dart-lang/dart-vim-plugin'
" Enable HTML syntax highlighting inside Dart strings with let dart_html_in_string=v:true (default false).
" Disable highlighting of core library classes with let dart_corelib_highlight=v:false (default true).
" Enable Dart style guide syntax (like 2-space indentation) with let dart_style_guide = 2
" Enable DartFmt execution on buffer save with let dart_format_on_save = 1
```

</p>
</details>
### C++
<details>
<summary>Detalhes</summary>
<p>

```vim
" This file contains additional syntax highlighting that I use for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
```

</p>
</details>
### Erlang Support
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-compiler'
```

</p>
</details>
### Elixir Support 
<details>
<summary>Detalhes</summary>
<p>

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

</p>
</details>
### Theme / Interface / Color Scheme
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'flazz/vim-colorschemes'
Plugin 'agude/vim-eldar'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'larsbs/vimtom' "Vim Vimtom Colorscheme - saporra só funciona no gui
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
```

</p>
</details>
### TOML
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'cespare/vim-toml'
```

</p>
</details>
### Typescript
<details>
<summary>Detalhes</summary>
<p>

```vim
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim.git'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

autocmd BufNewFile,BufRead *.ts set syntax=typescript
```

</p>
</details>
### Dark powered neo-completion
<details>
<summary>Detalhes</summary>
<p>

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

</p>
</details>
## Configuração geral
<details>
<summary>Detalhes</summary>
<p>

```vim
" OSX stupid backspace fix
set backspace=indent,eol,start

let g:elite_mode=1
```

</p>
</details>
## Configuração do neomake
<details>
<summary>Detalhes</summary>
<p>

```vim
let g:neomake_open_list = 2
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/neomake_error.log'
let g:neomake_highlight_columns=1
```

</p>
</details>
### Coffeescript
<details>
<summary>Detalhes</summary>
<p>

```vim
npm install -g coffeelint
"   npm install -g coffeelint
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffeelint.json"
```

</p>
</details>
### Elixir
<details>
<summary>Detalhes</summary>
<p>

```vim
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
```

</p>
</details>
### ruby 
<details>
<summary>Detalhes</summary>
<p>

```vim

```

</p>
</details>
### SCSS
<details>
<summary>Detalhes</summary>
<p>

```vim
let g:neomake_scss_enabled_markers = ['scss-lint']
```

</p>
</details>
### vim-table-mode
<details>
<summary>Detalhes</summary>
<p>

```vim
" tabelas em formato markdown
let g:table_mode_corner='|'
```

</p>
</details>
## Melhorar a visibilidade da indentação
Incluir `Plugin 'Yggdroot/indentLine'` no vundle.
Desabilitado no momento!
<details>
<summary>Detalhes</summary>
<p>

```vim
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_setConceal = 0
```

</p>
</details>
## Configuração do clang-format
A configuração foi extraída para um repositório próprio.
<details>
<summary>Detalhes</summary>
<p>

```vim
" git clone ssh://git@intmain.io:8322/geraldoim/dot_clang_format.git ~/.clang
" ln -sf ~/.clang/clang-format ~/.clang-format

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
```

</p>
</details>
### Color scheme

<details>
<summary>Detalhes</summary>
<p>

```vim
set background=dark
"colorscheme eldar
"colorscheme abbott
"colorscheme wombat
"colorscheme vimtom
colorscheme molokai
```

</p>
</details>
### Atalhos de teclado

<details>
<summary>Detalhes</summary>
<p>

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

</p>
</details>
