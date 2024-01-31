-- этот плагин создает меню которое вызывается при нажатии <leader>
return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.register({
            ["<leader>"] = {

                e = { ":Neotree float focus<CR>", "File System" },
                o = { ":Neotree float git_status<CR>", "Git Status" },
                K = { vim.lsp.buf.hover, "Hover Cursor"},
                f = {
                    name = "Find",
                    f = { "<cmd>Telescope find_files<cr>", "Find File" },
                    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
                    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
                },
                c = {
                    name = "Code",
                    a = { vim.lsp.buf.code_action, "Action"}
                },
                g = {
                    name = "GO",
                    f = { vim.lsp.buf.format, "Go Format"},
                    d = { vim.lsp.buf.definition, "Go Definition"}
                }

            },
        })
  end
}
