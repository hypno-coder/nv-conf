-- HOWTO
-- <CR> сразу вызывает команду
-- :dosomething - просто введет в консоль :dosomething
-- :dosomething<CR> - введет в консоль :dosomething и сразу запустит команду

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Quit

-- Russian nvim layout
vim.api.nvim_command(
    'set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz')
vim.keymap.set('i', 'оо', 'jj')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')


-- LSP
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format { async = true } end, {})
vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, {})
vim.keymap.set({ 'n', 'v' }, '<Leader>la', vim.lsp.buf.code_action, {})
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

-- Obsidian
vim.keymap.set('n', '<leader>no', ':ObsidianOpen<CR>')              -- open in obsedian
vim.keymap.set('n', '<leader>nn', ':ObsidianNew<CR>')               -- create new note
vim.keymap.set('n', '<leader>nv', ':ObsidianFollowLink vsplit<CR>') -- open link in vsplit
vim.keymap.set('n', '<leader>nh', ':ObsidianFollowLink hsplit<CR>') -- open link in hsplit
vim.keymap.set('n', '<leader>nt', ':ObsidianTemplate<CR>')          -- use template [name]

vim.keymap.set('n', '<leader>nfb', ':ObsidianBacklinks<CR>')        -- show all backlinks
vim.keymap.set('n', '<leader>nft', ':ObsidianTags<CR>')             -- find all tag occurances
vim.keymap.set('n', '<leader>nfn', ':ObsidianSearch<CR>')           -- search / create note [name]
vim.keymap.set('n', '<leader>nw', ':ObsidianWorkspace<CR>')         -- [NAME] to switch to another workspace.

vim.keymap.set('v', '<leader>nlc', ':ObsidianLinkNew<CR>') -- [TITLE] to create a new note and link it to an inline visual selection of text. This command has one optional argument: the title of the new note. If not given, the selected text will be used as the title.
vim.keymap.set('v', '<leader>nll', ':ObsidianLink<CR>')     -- [QUERY] to link an inline visual selection of text to a note. This command has one optional argument: a query that will be used to resolve the note by ID, path, or alias. If not given, the selected text will be used as the query.
vim.keymap.set('n', '<leader>nli', ':ObsidianPasteImg<CR>') -- [IMGNAME] to paste an image from the clipboard into the note at the cursor position by saving it to the vault and adding a markdown image link. You can configure the default folder to save images to with the attachments.img_folder option.

-- vim.keymap.set('n', '', ':ObsidianRename<CR>') -- [NEWNAME] [--dry-run] to rename the note of the current buffer or reference under the cursor, updating all backlinks across the vault. Since this command is still relatively new and could potentially write a lot of changes to your vault, I highly recommend committing the current state of your vault (if you're using version control) before running it, or doing a dry-run first by appending "--dry-run" to the command, e.g. :ObsidianRename new-id --dry-run.

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.opt.conceallevel = 1
