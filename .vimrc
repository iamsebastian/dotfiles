" -----------------------------------
" --------- BLEI on .vimrc ----------
" -----------------------------------
" Plugins {{{1
execute pathogen#infect()
runtime macros/matchit.vim

" Syntax, FileType, Colorscheme {{{1
syntax on
filetype plugin indent on
colorscheme badwolf
" :AirlineTheme badwolf

" General Settings {{{1
set autoread autowrite
set backspace=indent,eol,start
set clipboard^=unnamed
set completeopt+=longest,menuone
set dictionary+=/usr/share/dict/words
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set fileformats+=mac
" set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=eol:\ ,tab:▸\ ,trail:·
" set mouse=n ttymouse=sgr
set nojoinspaces
set nostartofline
set nrformats-=octal
set number relativenumber
set path=.,**
set report=0
set showcmd showbreak=↪
set splitbelow splitright
set switchbuf=useopen,usetab
set ttimeoutlen=50
set wildmenu wildcharm=<C-z>

" Search Settings {{{1
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=2

" Indent and Fold Settings {{{1
set softtabstop=4 shiftwidth=4 shiftround
set smarttab expandtab
" set autoindent breakindent breakindentopt=shift:4,sbr
set nofoldenable

" Status Line {{{1
set statusline=[%n]\ %<%f\ %m%r%w%y\ %{fugitive#head()}%=[%{&fenc},\ %{&ff}]\ L:%l/\%L\ C:%c

" Wildignore Settings {{{1
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" History, Backup, Undo {{{1
set history=10000
set noswapfile
set backup backupdir=~/.vim/backup/
set undofile undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
  set guioptions= lines=40 columns=140 guifont=Fira\ Mono:h13
endif

" General Mappings {{{1
let g:mapleader = ' '

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines
nnoremap <expr> j  v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k  v:count == 0 ? 'gk' : 'k'
nnoremap <expr> gj v:count == 0 ? 'j' : 'gj'
nnoremap <expr> gk v:count == 0 ? 'k' : 'gk'

" Expand buffer list similar to ## for the argslist
cnoremap %% <C-R>=buffer#list()<CR>

" Remap some default keys to be more useful
nnoremap Q gq
nnoremap Y y$
nnoremap S i<CR><ESC>^m`gk:silent! s/\s\+$//<CR>:noh<CR>``
nnoremap + za
xnoremap * :<C-u>call visualfuncs#start('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call visualfuncs#start('?')<CR>/<C-R>=@/<CR><CR>
nnoremap zS :<C-u>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>

" Visually Select a line without indentation
nnoremap <leader>v ^vg_

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" re-indent file while retaining cursor position.
nnoremap <leader>= :call format#reindent()<CR>

" Remove trailing whitespace
nnoremap <leader>w m`:%s/\s\+$//<CR>:let @/=''<CR>``

" cd to the current file's path
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" Buffer switching
nnoremap <expr> <leader>b buffer#switchBySplitting("horizontally")
nnoremap <expr> <leader>B buffer#switchBySplitting("vertically")

" Search mappings
xnoremap K :<C-u>grep! <C-r>=visualfuncs#getSelection()<CR> <bar> cwindow <bar> redraw!<CR>
nnoremap g/ /\<\><left><left>
nnoremap <leader>j :tjump /
nnoremap <leader>J :ptjump /

" Plugin Settings {{{1
let [html_indent_script1, html_indent_style1] = ["inc", "inc"]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]
let [fist_in_private, fist_anonymously] = [0, 0]
let g:no_default_tabular_maps = 1

" Use pymatcher instead of the fuzzy matcher provided with CtrlP
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" CtrlP settings
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 150
" No file limit
let g:ctrlp_max_files = 0
" Do not clear filename cache, to improve CtrlP startup time
" You can manually clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0
" If ag is available use it as filename list generator instead of 'find'
if executable('ag')
    " Let CtrlP use ag
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
    " Let grep use ag
    set grepprg=ag\ --hidden\ --vimgrep grepformat^=%f:%l:%c:%m
    " Let ack.vim use ag
    let g:ackprg='ag --nogroup --hidden --nocolor --column'
endif

" Airline settings.
" Use patched powerline fonts:
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there is only on tab open:
let g:airline#extensions#tabline#enabled = 1
" Airline theme is automatically chosen based on colorscheme.
" Airline section c would be the filename, but it is already shown in the
" tabbar:
let g:airline_section_c = ''
" Shortform mode text.
let g:airline_mode_map = {'__': '-', 'n': 'N', 'i': 'I', 'R': 'R', 'c': 'C', 'v': 'V', 'V': 'V', 's': 'S', 'S': 'S'}

let g:airline#extensions#tabline#enabled = 1

" Plugin Mappings {{{1
" CtrlP {{{2
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
" Dispatch {{{2
nnoremap d<space> :Dispatch<space>
nnoremap d<CR> :Dispatch<CR>
nnoremap m<CR> :Make<CR>
" Fugitive {{{2
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
" Tabular {{{2
nnoremap <leader>t :Tabularize<space>/
xnoremap <leader>t :Tabularize<space>/

" Autocommands {{{1
augroup VIMRC
  autocmd!
  " autocmd VimEnter * call cursor#changeShape()
  autocmd BufReadPost * silent! execute "normal! g`\""
  autocmd BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" Commands {{{1
command! BD silent e# | bd#
command! -bar Scriptnames call setqflist(scripts#get()) | copen
command! Mvim silent! execute "!mvim %" | redraw!

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set runtimepath^=~/dotfiles/.vim/bundle/ctrlp.vim

nmap <F8> :TagbarToggle<CR>
