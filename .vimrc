set showmatch
set number
set cursorline
set nobackup
set autoread
set noswapfile
set hidden
set vb t_vb=
set showcmd
set showmode
set clipboard+=unnamed
set guioptions+=a

highlight clear CursorLine
highlight CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

set tags+=/usr/local/java/jdk1.7.0/src/tags
set tags+=/usr/local/scala/scala-2.9.1.final/src/tags

"=== basic keybind
inoremap <C-c> <ESC>

"=== control code display
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
au BufRead,BufNew * match JpSpace /　/
highlight SpecialKey term=underline ctermfg=DarkYellow guifg=DarkYellow
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue

if $t_Co > 1
  syntax enable
endif
filetype indent on


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

