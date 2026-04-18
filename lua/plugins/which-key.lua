-- Описание:
-- Показывает всплывающее меню с доступными сочетаниями клавиш после нажатия <leader>. Упрощает запоминание и использование кастомных биндов.

-- 🛠 Инструкция по использованию:
-- 	1.	Нажми <leader> — по умолчанию это \ или SPC (в зависимости от твоего mapleader).
-- 	2.	Откроется меню с группами: f, g, d, t, l, n и т.д.
-- 	3.	Навигация: нажимай следующую клавишу из подсказки, чтобы вызвать нужную команду.

-- Например:
-- 	•	<leader>ff — поиск файла через Telescope.
-- 	•	<leader>dc — запуск DAP (отладчик).
-- 	•	<leader>e — открыть Neotree.

return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")
        wk.add({
            -- Основные команды
            { "<leader>q", desc = "Quit" },
            { "<leader>w", desc = "Write" },
            { "<leader>e", ":Neotree float focus<CR>", desc = "File System" },
            { "<leader>o", ":Neotree float git_status<CR>", desc = "Git Status" },
            { "<leader>K", function()
                if vim.lsp.buf.server_ready() then
                    vim.lsp.buf.hover()
                else
                    print("LSP not active")
                end
            end, desc = "Hover Cursor" },

            -- Группа "Find"
            { "<leader>f", group = "Find" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

            -- Группа "Code/Chat"
            { "<leader>c", group = "Code/Chat" },
            { "<leader>cg", "<cmd>ChatGPT<CR>", desc = "ChatGPT Start" },

            -- Группа "GO/Git"
            { "<leader>g", group = "GO/Git" },
            { "<leader>gd", desc = "Go Definition" },
            { "<leader>gr", desc = "Go References" },
            { "<leader>gp", desc = "Git Preview" },
            { "<leader>gb", desc = "Git Blame" },

            -- Группа "DAP"
            { "<leader>d", group = "DAP" },
            { "<leader>db", desc = "Toggle Breakpoint" },
            { "<leader>dB", desc = "Set Breakpoint" },
            { "<leader>dc", desc = "Continue" },

            -- Группа "Terminal"
            { "<leader>t", ":ToggleTerm direction=horizontal<CR>", desc = "Terminal" },
            { "<leader>tf", desc = "Float Terminal" },
            { "<leader>th", desc = "Horizontal Terminal" },

            -- Группа "LSP"
            { "<leader>l", group = "LSP" },
            { "<leader>ld", desc = "Diagnostic" },
            { "<leader>lD", desc = "Hover diagnostic" },
            { "<leader>lf", desc = "Format" },
            { "<leader>lr", desc = "Rename" },
            { "<leader>la", desc = "Action" },

            -- Подгруппа "Find" внутри "Notes"
            { "<leader>nf", group = "Find" },
            { "<leader>nfb", desc = "Backlinks" },
            { "<leader>nft", desc = "Tag occurrences" },
            { "<leader>nfn", desc = "Note by name, or create new" },

            -- Подгруппа "Link" внутри "Notes"
            { "<leader>nl", group = "Link" },
            { "<leader>nlc", desc = "Create a new note and link to selected", mode = "v" },
            { "<leader>nll", desc = "Link existing note to selection", mode = "v" },
            { "<leader>nli", desc = "Image from clipboard" },
        })
    end,
}


-- этот плагин создает меню которое вызывается при нажатии <leader>
-- return {
--     "folke/which-key.nvim",
--     config = function()
--         vim.o.timeout = true
--         vim.o.timeoutlen = 300
--         local wk = require("which-key.health").check()
--         wk.register({
--             ["<leader>"] = {
--                 q = "Quit",
--                 w = "Write",
--                 e = { ":Neotree float focus<CR>", "File System" },
--                 o = { ":Neotree float git_status<CR>", "Git Status" },
--                 K = { vim.lsp.buf.hover, "Hover Cursor" },
--                 f = {
--                     name = "Find",
--                     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--                     g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
--                     b = { "<cmd>Telescope buffers<cr>", "Buffers" },
--                     h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
--                 },
--                 c = {
--                     name = "Code/Chat",
--                     g = { "<cmd>ChatGPT<CR>", "ChatGPT Start" },
--                 },
--                 g = {
--                     name = "GO/Git",
--                     d = "Go Definition",
--                     r = "Go References",
--                     p = "Git Preview",
--                     b = "Git Blame",
--                 },
--                 d = {
--                     name = "DAP",
--                     b = "Toggle Breakpoint",
--                     B = "Set Breakpoint",
--                     c = "Continue",
--                 },
--                 t = {
--                     name = "Terminal",
--                     f = "Float Terminal",
--                     h = "Horizontal Terminal",
--                 },

--                 l = {
--                     name = "LSP",
--                     d = "Diagnostic",
--                     D = "Hover diagnostic",
--                     f = "Format",
--                     r = "Rename",
--                     a = "Action",
--                 },
--                 n = {
--                     n = 'Create new note',
--                     v = 'Open link in vsplit',
--                     h = 'Open link in hsplit',
--                     t = 'Use template',
--                     w = 'Workspace switch',
--                     f = {
--                         name = 'Find',
--                         b = 'Backlinks',
--                         t = 'Tag occurances',
--                         n = 'Note by name, or create new',
--                     },
--                     l = {
--                         name = 'Link',
--                         c = { 'Create a new note  and link to selected', mode = 'v' },
--                         l = { 'Link existing note to selection', mode = 'v' },
--                         i = 'Image from clipboard',

--                     }
--                 },
--             },
--         })
--     end,
-- }

