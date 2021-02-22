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

" Ctrl-P for faster file search
Plug 'ctrlpvim/ctrlp.vim'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Toml plugin
Plug 'cespare/vim-toml'

" Git plugin
Plug 'tpope/vim-fugitive'

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
" set shell=powershell.exe

" Filetypes for different languages
au BufRead,BufNewFile *.a51 set filetype=asm

" Folding
set foldmethod=indent
set foldlevel=1

" Coc Settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Coc Mappings
nmap <leader>n  <Plug>(coc-diagnostic-next-error)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Set colorscheme
let g:onedark_terminal_italics=1
" let g:onedark_termcolors=16
colorscheme onedark
