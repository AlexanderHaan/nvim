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
    use 'ianks/vim-tsx' -- TypeScript usein
    use 'neovim/nvim-lspconfig' -- LSP config package
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
      \ }
]])

-- Tab settings
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true

-- LSP Settings
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
}

require('lspconfig').ltex.setup { 
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    settings = {
        ltex = { 
            language = "de-DE", 
        }, 
    }, 
}

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
