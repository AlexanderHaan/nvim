set encoding=utf-8 " Right encoding
call plug#begin(stdpath('data') . '/plugged')

" NerdTree
Plug 'preservim/nerdtree'
" Line for Vim
Plug 'itchyny/lightline.vim'
" Autopairs for vim
Plug 'jiangmiao/auto-pairs'
" Emmet for vim
Plug 'mattn/emmet-vim'
" Ctrl-P for faster file search
Plug 'ctrlpvim/ctrlp.vim'
" Toml plugin
Plug 'cespare/vim-toml'
" Git plugin
Plug 'tpope/vim-fugitive'
" Dracula theme
Plug 'dracula/vim'
" Icons
Plug 'ryanoasis/vim-devicons'
" TypeScript Plugin
Plug 'ianks/vim-tsx'
" LSP config package
Plug 'neovim/nvim-lspconfig'

" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on " Plugins for files
syntax on " Pretty syntaxhighlighting
set backspace=indent,eol,start " For backward deletions
set hidden " Can edit files without to save them
set noswapfile " Swap file will be made
set hlsearch " For search highlighting
set wildmenu " For looking up for files
set nocompatible
set mouse=a " enable mouse

lua require('lspconfig').rust_analyzer.setup{}

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

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

" Set right shell
" set shell=powershell.exe

" Filetypes for different languages
au BufRead,BufNewFile *.a51 set filetype=asm
au BufRead,BufNewFile *.tex set filetype=tex

" Folding
set foldmethod=indent
set foldlevel=1

colorscheme dracula
