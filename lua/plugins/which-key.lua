-- этот плагин создает меню которое вызывается при нажатии <leader>
return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				q = "Quit",
				w = "Write",
				e = { ":Neotree float focus<CR>", "File System" },
				o = { ":Neotree float git_status<CR>", "Git Status" },
				K = { vim.lsp.buf.hover, "Hover Cursor" },
				f = {
					name = "Find",
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
				},
				c = {
					name = "Code/Chat",
					g = { "<cmd>ChatGPT<CR>", "ChatGPT Start" },
				},
				g = {
					name = "GO/Git",
					d = "Go Definition",
					r = "Go References",
					p = "Git Preview",
					b = "Git Blame",
				},
				d = {
					name = "DAP",
					b = "Toggle Breakpoint",
					B = "Set Breakpoint",
					c = "Continue",
				},
				t = {
					name = "Terminal",
					f = "Float Terminal",
					h = "Horizontal Terminal",
				},

				l = {
					name = "LSP",
					d = "Diagnostic",
					D = "Hover diagnostic",
					f = "Format",
					r = "Rename",
					a = "Action",
				},
			},
		})
	end,
}
