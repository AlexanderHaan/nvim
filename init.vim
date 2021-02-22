call plug#begin(stdpath('data') . '/plugged')

" NerdTree
Plug 'preservim/nerdtree'

" One Dark Colorscheme
Plug 'joshdick/onedark.vim'

" Line for Vim
Plug 'itchyny/lightline.vim'

" Autopairs for vim
Plug 'jiangmiao/auto-pairs'

" Emmet for vim
Plug 'mattn/emmet-vim'

" Resizing of windows
Plug 'simeji/winresizer'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Ctrl-P for faster file search
Plug 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on " Plugins for files
syntax on " Pretty syntaxhighlighting
set backspace=indent,eol,start " For backward deletions
set hidden " Can edit files without to save them
set noswapfile " Swap file will be made
set encoding=utf-8 " Right encoding
set hlsearch " For search highlighting
set wildmenu " For looking up for files
set nocompatible

" Set own leader
let mapleader=","

" Line numbers
set number
set relativenumber

" Settings for NerdTREE
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1

" Vertical Split below
set splitbelow

" Terminal settings
tnoremap jj <C-\><C-N>

" For tags jumping
nnoremap <leader>t <C-]>

" Don't use Escape button
inoremap jj <ESC>

" Only this will be runtimepath
let $RTP=stdpath('config')
let $RC=stdpath('config') . '/init.vim'

" Set right path for find
set path=.,**
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ }
set laststatus=2

" Set right shell
set shell=powershell.exe

" Filetypes for different languages
au BufRead,BufNewFile *.a51 set filetype=asm

" Folding
set foldmethod=indent
set foldlevel=1

" Set colorscheme
let g:onedark_terminal_italics=1
" let g:onedark_termcolors=16
colorscheme onedark
