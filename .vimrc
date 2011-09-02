
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


set tags+=/usr/local/java/jdk1.6.0_23/src/tags
set tags+=/usr/local/scala/scala-2.8.1.final/src/tags

"=== twitvim
let twitvim_token_file = ".twitvim.token"
let twitvim_count = 100
let twitvim_api_root = "https://api.twitter.com/1"
let twitvim_enable_perl = 1

