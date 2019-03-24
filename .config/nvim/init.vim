
"=== Vim config
set showtabline=2

"=== initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

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

