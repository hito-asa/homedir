
"=== initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

"=== Vim config
set nocompatible
filetype off
filetype plugin indent on
set showtabline=2
set showmatch
set showcmd
set showmode
set ruler
set laststatus=2
set title
set linespace=0
set wildmenu
set nowrap
set cursorline
set backup
set backupdir=$HOME/.vim/backup
set autoread
set noswapfile
set hidden
set vb t_vb=
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
set autoindent sw=2 et
set cindent
set backspace=indent,eol,start
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set viminfo+=n/tmp/.viminfo
set maxmempattern=16384

"=== basic keybind
noremap j gj
noremap k gk
inoremap <C-c> <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
map <PageUp> <C-U>
map <PageDown> <C-D>

"=== scroll-smooth & quick!
map <C-U> <C-Y>2<C-Y>2<C-Y>2<C-Y>2<C-Y><C-Y>
map <C-D> <C-E>2<C-E>2<C-E>2<C-E>2<C-E><C-E>

"=== syntax
syntax enable
filetype indent on

"=== color
set t_Co=256
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

"=== control code display
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
au BufRead,BufNew * match JpSpace /　/
highlight SpecialKey term=underline ctermfg=DarkYellow guifg=DarkYellow
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue

"=== keep edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"=== netrw
let g:netrw_hide=1
let g:netrw_list_hide='^(\.svn|\.git)/$'

"=== vimfiler
let vimfiler_as_default_explorer = 1

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 2
  autocmd BufReadPost * set ft=xxd | endif
augroup END

"=== Airline config
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '🚫'
let g:airline#extensions#ale#warning_symbol = '⚠ '
let g:airline#extensions#virtualenv#enabled = 1

"=== deoplete
let g:deoplete#enable_at_startup = 1

"=== vim-gitgutter
set updatetime=250

"=== ale
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '⚠'

