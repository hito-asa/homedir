set nocompatible
set showmatch
set showcmd
set showmode
set ruler
set laststatus=2
set title
set linespace=0
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&filetype.']'}%=%l,%c%V%8P
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
set tags+=/usr/local/java/jdk1.7.0/src/tags
set tags+=/usr/local/scala/scala-2.9.1.final/src/tags

"=== basic keybind
noremap j gj
noremap k gk
inoremap <C-c> <ESC>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"=== syntax
if $t_Co > 1
  syntax enable
endif
filetype indent on

"=== color
colorscheme wombat
highlight clear CursorLine
highlight CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
if g:colors_name ==? 'wombat'
  hi Visual gui=none guifg=khaki guibg=olivedrab
endif

"=== control code display
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
au BufRead,BufNew * match JpSpace /　/
highlight SpecialKey term=underline ctermfg=DarkYellow guifg=DarkYellow
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue


"=== twitvim
let twitvim_count = 100
let twitvim_api_root = "https://api.twitter.com/1"
let twitvim_enable_python = 1

"=== IME control
au InsertLeave * call PyIBusDisable()
function! PyIBusDisable()
python << EOF
import ibus
bus = ibus.Bus()
ic = ibus.InputContext(bus, bus.current_input_contxt())
ic.disable()
EOF
endfunction

