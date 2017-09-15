execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme ron
set t_Co=256
set number
set relativenumber                              " Relative line numbers.
set autoindent
set ignorecase                                  " Ignore case in search patterns.
set hlsearch
set wildmenu
set hidden                                      " Allow switching between unsaved buffers.
set scrolloff=2
set laststatus=2                                " Always show status line.
set nobackup
set nowritebackup
set noswapfile

set autoread					" Automatically re-read file when changed.
au CursorHold,CursorHoldI * checktime           " Needed in combination with above.

autocmd BufWinLeave *.* mkview                  " Save views when leaving buffer.
autocmd BufWinEnter *.* silent loadview         " Load saved views when entering buffer.

autocmd FileType python,sh,c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript,html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set formatprg=par
let mapleader = " "                             " Change Leader `\` to <Space>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>v :e ~/.vimrc<CR>
nnoremap <Leader>w :w<CR>
cmap w!! %!sudo tee %>/dev/null<CR>             " Write file using sudo.
nnoremap <silent><Leader>p :set paste ! <CR>    " Toggle paste.
nnoremap <silent><Leader>h :set hlsearch !<CR>  " Toggle highlighting.
nnoremap <Leader>n :set nu !<CR>                " Toggle line numbers.
nnoremap <Leader>r :set rnu !<CR>               " Toggle relative line numbers.
nnoremap <Leader>l :set wrap !<CR>              " Toggle word wrap.
nnoremap <Leader>$ :set list !<CR>              " Toggle list characters.

nnoremap <Leader>\| :set cursorcolumn !<CR>
highlight CursorColumn ctermbg=24
nnoremap <Leader>- :set cursorline !<CR>
highlight CursorLine ctermbg=24

" Toggle vertical color column at 80 characters.
nnoremap <Leader>c :call g:ToggleColorColumn()<CR>
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=80
  endif
endfunction
highlight ColorColumn ctermbg=24

nnoremap <Leader>e :25vs +Explore<CR>	" NerdTree-style drawer. Current file directory.
nnoremap <Leader>E :25vs +edit.<CR>	" NerdTree-style drawer. Current directory.
let g:netrw_banner = 0			" Hide netrw banner.
let g:netrw_browse_split = 4		" <CR> opens file in previous window like `P`.
let g:netrw_winsize = 25		" Default window size for :Hex and :Vex
let g:netrw_liststyle = 3		" Tree style listing.
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu' " Add nu and rnu to defaults.

" Show buffer list and prompt input.
nnoremap <Leader><Space> :ls<CR>:b<Space>
" Quick buffer prompt.
nnoremap <Leader><TAB> :b<Space>
" Split-friendly buffer delete.
nnoremap <Leader>d :bp\|bd! #<CR> 

" Buffer navigation. Best used with vim-airline.
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
inoremap <C-j> <ESC>:bp<CR>
inoremap <C-k> <ESC>:bn<CR>

" Easy resizing of window splits.
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" vim-anzu.
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
set statusline=%{anzu#search_status()}

" vim-airline.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'papercolor'
let g:promptline_present = {
  \'a' : [ promptline#slices#host() ],
  \'b' : [ promptline#slices#user() ],
  \'c' : [ promptline#slices#cwd() ],
  \'y' : [ promptline#slices#vcs_branch(), promptline#slices#python_virtualenv() ],
  \'warn' : [ promptline#slices#last_exit_code() ]
  \} 
