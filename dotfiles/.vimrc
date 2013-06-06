
" g; jump back to last edited position.
" gi jump back to last edited position and switch to insert mode
" / C-F

" TABS
" a tab can be used, when one wants to temporary edit a file, but does not
" want to change anything in the current layout of windows and buffers
" <C-PageUp> and <C-PageDown> will switch between tabs
" <C-w>T will move the current window to a new tab page

set nocompatible

call pathogen#infect()
" Не забываем запускать :Helptags после установки новых плагинов
" чтобы обновить справку

syntax on " включаем раскрашивание кода
filetype plugin indent on

let mapleader="," " меняем <leader> на более удобную кнопку

" теперь можно нажимать ; чтобы перейти в командный режим
"   это позволяет экономить на движении правой рукой в сторону шифта
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
" set showmatch     " set show matching parenthesis


" == FOLDING
set foldmethod=indent " fold nested lines
set foldnestmax=2     " limit number of levels
set foldminlines=2
highlight Folded cterm=NONE ctermfg=darkgrey ctermbg=NONE
set fillchars=fold:\ 

nmap <silent> <leader>a zA
nmap <silent> <leader>r zr
nmap <silent> <leader>R zR
nmap <silent> <leader>m zm
nmap <silent> <leader>M zM


set showcmd       " show partial command in status line
set wildmenu      " show list of variants on <tab>
set wildmode=longest:full,full

set cursorline    " highlight the screen line of the cursor
set scrolloff=2   " 2 lines above/below cursor when scrolling

hi CursorLine cterm=NONE ctermbg=darkgrey

" To make vsplit put the new buffer on the right of the current buffer
set splitright

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
set listchars=tab:▸\ ,trail:·,nbsp:·

set textwidth=78

" <F2> in insert mode to :set noautoindent
set pastetoggle=<F2>


" Sessions
set ssop-=options " do not store global and local values in a session
nmap <silent> <leader>ss :mksession! .ss.vim<CR> :wa<CR>
nmap <silent> <leader>sx :mksession! .ss.vim<CR> :wqa<CR>
nmap <silent> <leader>sl :source .ss.vim<CR>
nmap <silent> <leader>sp !git ci -am `date` && git push

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" === CTRL-P Fuzzy search
" https://github.com/kien/ctrlp.vim
"
"  <c-t> "    Open the selected file in a new 'tab'.
"  <c-v> "    Open the selected file in a 'vertical' split.
let g:ctrlp_map = '<c-p>'
" Search in files, buffers and MRU files at the same time.
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_by_filename = 1 " Search by filename (as opposed to full path)
let g:ctrlp_regexp = 1      " Set regexp search as the default
" don't search in repo dirs
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|cabal-dev$',
    \ 'file': '\v\.(hi|o)$',
    \ }
" only update the match window after typing's been stopped for 250ms
let g:ctrlp_lazy_update = 250

" search in buffers
nmap <silent> <leader>f :CtrlPLine<CR>

" === grep
nmap <silent> <leader>gr :Rgrep<CR>
nmap <silent> <leader>gb :GrepBuffer<CR>

" === NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>


" ==== Rainbow parentheses
" https://github.com/vim-scripts/Rainbow-Parentheses-Improved-and2
let g:rainbow_active = 1
let g:rainbow_operators = 1

" REFS
" - http://nvie.com/posts/how-i-boosted-my-vim/
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" + http://amix.dk/vim/vimrc.html
" + http://mirnazim.org/writings/vim-plugins-i-use/
" + http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim

" PLUGINS to consider
"  - https://github.com/ervandew/supertab
"  - https://github.com/vim-scripts/YankRing.vim
"  - http://code.google.com/p/conque/
"  - https://github.com/eagletmt/ghcmod-vim
