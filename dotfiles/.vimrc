
set nocompatible

call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader=","
nnoremap ; :

" Use <tab> to move between parentheses
nnoremap <tab> %
vnoremap <tab> %


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Hides buffers instead of closing them.
" This means that you can have unwritten changes to a file and open a new file
" using :e, without being forced to write or undo your changes first.
set hidden

" write changes before switching to another buffer
set autowrite " doesn't work for :e
" set autowriteall " might be dangerous


set expandtab     " replace tab with spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmatch     " set show matching parenthesis

set showcmd       " show partial command in status line
set wildmenu      " show list of variants on <tab>
set wildmode=longest:full,full
set cursorline    " highlight the screen line of the cursor
                  " useful to easily spot the cursor

set ttyfast

" === Persistent undo
set undofile
set undodir=~/.vim/undodir


" === Searching
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
" clear highlighted searches
nmap <silent> <leader><space> :nohlsearch<CR>

set nobackup
set noswapfile

" make Vim set out tab characters, trailing whitespace and invisible spaces
" visually
set list
set listchars=tab:>.,trail:.,nbsp:.


set textwidth=78

" <F2> in insert mode to :set noautoindent
set pastetoggle=<F2>


" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap kj <esc>
nmap H 0
nmap L $

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" This lets you use w!! to save file with sudo
cmap w!! w !sudo tee % >/dev/null


" === Fuzzy search
" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
" Search in files, buffers and MRU files at the same time.
let g:ctrlp_cmd = 'CtrlPMixed'
" don't search in repo dirs
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|cabal-dev$',
    \ 'file': '\v\.(hi|o)$',
    \ }
" only update the match window after typing's been stopped for 250ms
let g:ctrlp_lazy_update = 250

" === NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>



" REFS
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
