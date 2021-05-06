filetype plugin indent on
syntax on

" Various settings {{{
set autoindent
set ignorecase
set hidden
set ruler
set wildmenu
set wildignore+=**/node_modules/**
set number relativenumber
set undodir=~/.vim/undodir
set undofile

set shiftwidth=4
let &softtabstop = &shiftwidth
set expandtab

set incsearch
set hlsearch
set copyindent

set statusline=%<\ %f\ %m%r%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\ 
set cmdheight=2

set foldlevelstart=999
set foldmethod=marker
set scrolloff=5
set splitbelow
set splitright

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set showbreak=↪
set linebreak

set path+=**
set laststatus=2

set clipboard+=unnamed,unnamedplus
"}}}

" {{{ minpac
packadd minpac
call minpac#init()

call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf', {'do': { -> fzf#install() } } )
call minpac#add('junegunn/fzf.vim')
call minpac#add('caksoylar/vim-mysticaltutor')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('romainl/vim-cool')
call minpac#add('wellle/targets.vim')
call minpac#add('kassio/neoterm')

call minpac#add('rhysd/clever-f.vim')
"}}}

" Commands {{{
command! PackUpdate packadd minpac | source $VIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $VIMRC | call minpac#clean()
command! -bang -nargs=* Rg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

augroup myvimrc
    au!
    au BufWritePost .vimrc so $VIMRC
augroup END

augroup win_resize_splits
  autocmd VimResized * wincmd =
augroup END
" }}}

" UI {{{
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set ttyfast
set lazyredraw

colorscheme mysticaltutor
hi Normal guibg=NONE ctermbg=NONE
"}}}

" Mappings {{{
let g:mapleader="\<Space>"
inoremap jk <c-c>`^
nnoremap <leader>t :execute 'Files '<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <leader>rnt :echo join(split(&runtimepath, ','), "\n")<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Git Mappings
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gp :Gpush<CR>

" Terminal
nnoremap <silent> <leader>o :vertical botright terminal<cr><C-w>
tnoremap <leader><esc> <C-\><C-n><esc><cr>
"}}}

" Navigation {{{
" When navigating to the EOF, center the screen
nnoremap G Gzz

" Use 'H' and 'L' keys to move to start/end of the line
noremap H g^
noremap L g$

" Recenter when jump back
nnoremap <C-o> <C-o>zz
"}}}

" Floating FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

