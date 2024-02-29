-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Quit

-- Russian nvim layout
vim.api.nvim_command('set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz')
vim.keymap.set('i', 'оо', 'jj')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')


-- LSP
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, {})
vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, {})
vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)


-- Buffer
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<cr>')
vim.keymap.set('n', '<S-h>', ':bprev<cr>')
vim.keymap.set('n', '<Leader>x', ':bdelete<cr>')
vim.keymap.set('n', '<C-g>', ':split<cr>')
vim.keymap.set('n', '<C-v>', ':vsplit<cr>')


-- Splits
vim.keymap.set('n', '\\', ':vsplit<CR>')
vim.keymap.set('n', '|', ':split<CR>')

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
