-- Set variables
local set = vim.opt

set.encoding = 'utf-8' -- UTF-8 encoding

require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer manages itself
    use 'preservim/nerdtree' -- NerdTree
    use 'itchyny/lightline.vim' -- Line for Vim
    use 'jiangmiao/auto-pairs' -- Autopairs for vim
    use 'mattn/emmet-vim' -- Emmet for vim
    use 'ctrlpvim/ctrlp.vim' -- Ctrl-P for faster file search
    use 'cespare/vim-toml' -- Toml plugin
    use 'tpope/vim-fugitive' -- Git plugin
    use 'dracula/vim' -- Dracula theme
    use 'ryanoasis/vim-devicons' -- Icons
    use 'neovim/nvim-lspconfig' -- LSP config package
    use 'MaxMEllon/vim-jsx-pretty' -- React plugin
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'nvim-treesitter/nvim-treesitter' -- Treesitter
    use {'nvim-orgmode/orgmode'} -- Org mode for neovim
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim"
    }
end)

vim.cmd('filetype plugin indent on') -- Enable filetype
vim.cmd('syntax on') -- enable syntax highlighting
set.backspace = {'indent', 'eol', 'start'} -- For backward deletions
set.hidden = true -- Can edit files without to save them
set.swapfile = false -- Swap file will not be made
set.hlsearch = true -- For search highlighting
set.wildmenu = true -- Enable wildmenu
set.compatible = false -- not compatible with vi
set.mouse = 'a' -- enable mouse

-- Lightline settings
vim.cmd([[
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
]])

-- Ctrl-P Settings
vim.g.ctrlp_custom_ignore = { dir = 'node_modules', }

-- Tab settings
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true

-- Set map leader
vim.g.mapleader = ','

-- Line numbers
set.number = true
set.relativenumber = true

-- Settings for NerdTree
vim.g.NERDTreeShowLineNumbers = 1
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {})

-- Map for tags jumping
vim.api.nvim_set_keymap('n', '<leader>t', '<C-]', {noremap = true})

-- Don't use Escape button
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true})

-- Only this will be runtimepath
vim.cmd([[
let $RTP=stdpath('config')
let $RC=stdpath('config') . '/init.lua'
]])

-- Set path for find
set.path = {'.', '**'}

-- Filetype for different languages
vim.cmd('au BufRead,BufNewFile *.tex set filetype=tex')

-- Folding
set.foldmethod = 'indent'
set.foldlevelstart = 99 -- no folds at beginning

-- Colorscheme
vim.cmd('colorscheme dracula')
