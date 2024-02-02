-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Quit

-- Russian nvim layout
vim.api.nvim_command('set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')

-- Buffer
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<cr>')
vim.keymap.set('n', '<S-h>', ':bprev<cr>')


-- Splits
vim.keymap.set('n', '\\', ':vsplit<CR>')
vim.keymap.set('n', '|', ':split<CR>')

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<cr>')




