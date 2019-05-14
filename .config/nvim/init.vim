""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
    " linting
    Plug 'neomake/neomake'
    " completion
    Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'joshdick/onedark.vim' " colorscheme
    Plug 'itchyny/lightline.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'ap/vim-buftabline'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " Showing function signature and inline doc.
    Plug 'Shougo/echodoc.vim'
    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Language Server Protocols support
    Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

let g:deoplete#enable_at_startup=1
let g:deoplete#sources#jedi#show_docstring = 1

" run neomake automatically (in filemode)
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undofile
set undodir=~/.local/nvim/undodir
set nocompatible
set encoding=utf-8
" faster scrolling
set ttyfast
" enable syntax processing
syntax enable
" indentation
set expandtab                   " tabs are spaces
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set textwidth=80                " Line-Wrapping
set shiftwidth=4                " number of spaces to use for each auto-indent, i.e. >>, << commands
" UI config
set mouse=a
set number                      " show line numbers
set showcmd                     " shows last command entered in the very bottom right of vim
set ruler                       " display cursor position
set cursorline                  " highlight current line
filetype plugin indent on       " load filetype-specific indent files...?
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to...
set colorcolumn=80
" Searching
set showmatch                   " highlight matching [{()}]
set incsearch                   " search as characters are entered /
set hlsearch                    " highlight matches
set ignorecase                  " ignore case in search patterns
set smartcase                   " override ignorecase if search pattern has capital letters
" set visualbell
set noerrorbells
set autowrite                   " save on buffer switch
" backups and swapfiles
set nobackup
set noswapfile
set fileformats=unix,mac,dos    " the EOL formats to try when editin
" More natural split opening
set splitbelow
set splitright
set scrolloff=5
set laststatus=2
set clipboard+=unnamedplus      " merge sys and vim clipboard


" whitespace handling - delete all trailing
function! StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e             " delete trailing whitespace
        call cursor(l,c)        " return cursor to previous position
endfunction
augroup filetype_strip
    autocmd!
    autocmd BufWritePre *  :call StripTrailingWhitespaces()
augroup END

" abbreviations
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the
iabbrev ehtn then
iabbrev latex LaTeX
iabbrev anythign anything
iabbrev tuping typing
iabbrev ti it
iabbrev thugh though
iabbrev hae have
" Command mode abbrevs
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qall

augroup vimperator
    au!
    au BufReadPost .vimperatorrc setf vim
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
let localmapleader='\'
inoremap jj <ESC>

" vim splits navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" shortcuts for goto vimrc and sourcing
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap - dd
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Turn off search highlight. (mnemonic: [n]o h[l]ight)
nnoremap <silent> <leader><Space> :nohlsearch<CR>
" never enter exmode
nnoremap Q <nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>bd :bd<CR>
" open last buffer
nnoremap <leader><leader> <C-^>
" Make current window only one on screen; close all others
nnoremap <leader>o :only<CR>
" use tab to open folds
nnoremap <Tab> za
" Y was synon for yy; make it work like D
noremap Y y$
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" command mode emacs begin end jumps
cnoremap <C-a> <Home>
cnoremap <C-e> <END>
" Dos2Unix CLRF conversions
command Dos2Unix %s/\r\(\n\)/\1/g
" save a file using sudo when it was opened without
cnoremap w!! w !sudo tee % > /dev/null
" open vim cheatsheet in split
nnoremap <leader>chs :sp $HOME/notes/vim-cheatsheet.md<CR>
" Auto change dir to match curr file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

""""""""""""""""""""
"  Split resizing  "
""""""""""""""""""""
function! IntelligentVerticalResize(direction)
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Right> :call IntelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call IntelligentVerticalResize('left')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Management                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
"  Colorscheme one-dark  "
""""""""""""""""""""""""""
" Set the background theme to dark
set background=dark
" Call the theme one

" This line enables the true color support.
" If tmux -V >= 2.2 tmux also supports truecolor!
if (has("termguicolors"))
    set termguicolors
endif

colorscheme onedark

" Don't forget set the airline theme as well.
" let g:airline_theme = 'one'


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

""""""""""""""""
"  buftabline  "
""""""""""""""""
let g:buftabline_show=1 "only show buftabline if more than one buffer open
let g:buftabline_numbers=1
let g:buftabline_indicators=1
let g:buftabline_separators=1


""""""""""""""""
"  ultisnip    "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" C-Tab (default) for list only works in gvim. Terminal emulators eat C-Tab
let g:UltiSnipsListSnippets = "<C-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set runtimepath+=~/.config/nvim/my-snippets/

" fzf
nmap <leader><tab> :Files<CR>

"""""""""""""
"  Neomake  "
"""""""""""""
"let g:neomake_python_pylint_exe = 'pylint'

"let g:neomake_python_enabled_makers = ['mypy', 'python', 'pylint']
"let g:neomake_python_pylint_exe = 'pylint3'
"let g:neomake_python_python_exe = 'python3'
let g:neomake_python_enabled_makers = ['mypy']
let g:neomake_python_mypy_args = ['--ignore-missing-imports',
            \ '--follow-imports=skip', '--python-version', '3.5']
let g:neomake_java_enabled_makers = ['javac']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Language Servers Configurations                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" intellisense, hover, jumpto, find references/usages, (completion)

" Required for operations modifying multiple buffers like rename.
set hidden

" pip install python-language-server
" now vim will loadup language server when opening python files
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.python = ['pyls']
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_signColumnAlwaysOn = 1
"let g:LanguageClient_selectionUI = 1

" RPC calls to server
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F4> :call LanguageClient_textDocument_rename()<CR>
autocmd FileType python nnoremap <buffer>
  \ K :call LanguageClient_textDocument_hover()<CR>
autocmd FileType python nnoremap <buffer>
  \ <leader>si :call LanguageClient_textDocument_definition()<CR>
" rename not supported atm?
autocmd FileType python nnoremap <buffer>
  \ <F4> :call LanguageClient_textDocument_rename()<CR>

" <leader>lf to fuzzy find the symbols in the current document
autocmd FileType python nnoremap <buffer>
  \ <leader>sf :call LanguageClient_textDocument_documentSymbol()<cr>

" to use language server with vim's gq
autocmd FileType python set formatexpr=LanguageClient_textDocument_rangeFormatting()<CR>

autocmd FileType python nnoremap <leader>ss :call LanguageClient_textDocument_documentSymbol()<CR>

autocmd FileType python nnoremap <leader>su :call LanguageClient_textDocument_references()<CR>

autocmd FileType python nnoremap <leader>fd :call LanguageClient_textDocument_formatting()<CR>

