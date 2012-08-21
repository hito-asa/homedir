set nocompatible
filetype off

"=== initialize vundle
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'TwitVim'
Bundle 'project.tar.gz'
Bundle 'bufexplorer.zip'
Bundle 'sudo.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'aharisu/vim_goshrepl'

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
set nobackup
set autoread
set noswapfile
set hidden
set vb t_vb=
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
set autoindent
set cindent
set backspace=indent,eol,start

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

"=== color
set t_Co=256
colorscheme wombat
highlight clear CursorLine
highlight CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
if g:colors_name ==? 'wombat'
  hi Visual gui=none guifg=khaki guibg=olivedrab
endif

"=== syntax
if $t_Co > 1
  syntax enable
endif
filetype indent on

"=== control code display
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
au BufRead,BufNew * match JpSpace /　/
highlight SpecialKey term=underline ctermfg=DarkYellow guifg=DarkYellow
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue

"=== netrw
let g:netrw_hide=1
let g:netrw_list_hide='^\.svn/$'

"=== powerline
let g:Powerline_symbols = 'fancy'

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
if stridx(system('uname -a'), "Ubuntu") >= 0 && $USER != "root"
  au InsertLeave * call PyIBusDisable()
  function! PyIBusDisable()
python << EOF
import ibus
bus = ibus.Bus()
ic = ibus.InputContext(bus, bus.current_input_contxt())
ic.disable()
EOF
  endfunction
endif

"=== external config
if filereadable(expand('~/.vimrc.unshared'))
  so ~/.vimrc.unshared
endif

