set nocompatible
filetype off

"=== initialize neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'TwitVim'
NeoBundle 'project.tar.gz'
NeoBundle 'bufexplorer.zip'
NeoBundle 'sudo.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'scratch.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tfnico/vim-gradle'

filetype plugin indent on

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
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"=== tags
set tags=~/.tags
if filereadable(".tags")
  set tags+=.tags
endif

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
let g:netrw_list_hide='^\.svn/$'

"=== powerline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1
let g:airline_inactive_collapse=1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_solarized_bg="dark"
let g:airline_theme="solarized"
let g:airline_powerline_fonts=0
let g:airline_symbols = {'paste':1, 'readonly':2, 'whitespace':3, 'linenr':4, 'branch':5}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"=== git
let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
highlight clear SignColumn

"=== neocomplcache
let g:neocomplcache_enable_at_startup = 1

"=== project
"let g:proj_flags = "imstc"
nmap <silent> <Leader>p <Plug>ToggleProject
nmap <silent> <Leader>P :Project<CR>

"=== vimfiler
let vimfiler_as_default_explorer = 1

"=== twitvim
let twitvim_count = 100
let twitvim_api_root = "https://api.twitter.com/1"
let twitvim_enable_python = 1
let twitvim_show_header = 0

"=== IME control
"if stridx(system('uname -a'), "Ubuntu") >= 0 && $USER != "root"
"  au InsertLeave * call PyIBusDisable()
"  function! PyIBusDisable()
"python << EOF
"import ibus
"bus = ibus.Bus()
"ic = ibus.InputContext(bus, bus.current_input_contxt())
"ic.disable()
"EOF
"  endfunction
"endif

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 2
  autocmd BufReadPost * set ft=xxd | endif
augroup END

"=== external config
if filereadable(expand('~/.vimrc.unshared'))
  so ~/.vimrc.unshared
endif

