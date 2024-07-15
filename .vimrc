" Disable v1 compatibility.
set nocompatible

" Load vim plugins.
call plug#begin()

Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'preservim/nerdtree'
Plug 'farmergreg/vim-lastplace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'on': []}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'

call plug#end()

""""""""""""""""""
" Plugin configs "
""""""""""""""""""

" DelimitMate
let delimitMate_autoclose = 1
let delimitMate_jump_expansion = 1

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Airline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=300

" Enable file type detection.
filetype on

" Enable plugins and load plugins for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn on syntax highlighting.
syntax on

" Turn on line numbering.
set number
 
" Highlight cursor line horizontally.
" set cursorline 

" Set shift width to four spaces.
set shiftwidth=4 

" Set tab width to four columns.
set tabstop=4 

" Do not save backup files.
set nobackup 

" Do not let cursor scroll above or below N number of lines.
set scrolloff=15 

" Case-insensitive search.
set ignorecase 

" Override `ignorecase` when searching for capital letters.
set smartcase

" Show matching words during search.
set showmatch

" Use highlighting when performing a search.
set hlsearch

" Enable auto completion menu after pressing tab.
set wildmenu

" Make wildmenu behave similar to bash completion.
set wildmode=list:longest

" Ignore these file extensions in wildmenu.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable soft wrapping.
set wrap

" Don't wrap in the middle of a word.
set linebreak

" Set the correct file types for new files.
autocmd BufRead,BufNewFile *.py set ft=python
autocmd BufRead,BufNewFile *.c set ft=c

" Allow pressing left and right arrow keys at the start and end of lines to move up or down a line.
set whichwrap+=<,>,h,l

" Add a colored margin at the Nth column.
au FileType python set colorcolumn=80
au FileType c set colorcolumn=80

" Allow CTRL + SHIFT + v for pasting.
" THIS WILL FUCK UP DELIMITMATE!!!
"set paste

" Set the color scheme using Groovbox plugin.
autocmd vimenter * ++nested colorscheme gruvbox

" color scheme fix for tmux when using dark themes
set background=dark

" Pane navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Save and run the currently open file.
"nnoremap <F5> <esc>:w<enter>:!%:p<enter>
"inoremap <F5> <esc>:w<enter>:!%:p<enter>

set mouse=a

""""""""""""""""""""""""""""""""""""""""""
" COLOR SCHEME FIX FOR TMUX!!
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
endif

set t_ut=
set termguicolors
""""""""""""""""""""""""""""""""""""""""""
