local set = vim.opt

-- map for compile
vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<leader>r',
    ':!latexmk<CR>', {}
)

-- Beatiful word wrap
set.wrap = true
set.linebreak = true

-- Mapping for movement in paragraph
vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', {noremap = true})
vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', {noremap = true})
