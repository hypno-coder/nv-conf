
-- Описание:
-- Мощный плагин для интеграции терминала в Neovim. Позволяет запускать встроенные терминалы в разных режимах: float, horizontal, vertical, tab.

-- 📌 Инструкция по использованию:
-- 	•	Ctrl+\ — открыть/закрыть терминал (согласно open_mapping)
-- 	•	Внутри терминала:
-- 	•	jk или Esc — выйти в нормальный режим
-- 	•	Ctrl + h/j/k/l — перемещаться между окнами
-- 	•	Ctrl + w — перейти в управление окнами

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
      persist_mode = true,
			shade_terminals = true,
      shell = vim.o.shell,
			shading_factor = 50,
			open_mapping = [[<c-\>]],
			direction = "float",
			float_opts = {
				border = "double",
				width = 100,
				height = 30,
				winblend = 5,
				highlights = {
					border = "Blue",
					background = "Cyan",
				},
			},
		})
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
