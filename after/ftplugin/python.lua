local set = vim.opt

-- Tab options
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- Color column
set.colorcolumn = { 80 } 

-- Ignore python files
vim.opt_local.path = {'src/**', 'tests', 'bin/**'}
vim.opt_local.wildignore = {'*/__pycache__/*', '*.pyc'}
