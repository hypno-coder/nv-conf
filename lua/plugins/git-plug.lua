
-- 📦 tpope/vim-fugitive

-- Описание:
-- Мощный плагин для интеграции Git в Neovim. Позволяет выполнять git-команды прямо из редактора.

-- Как использовать:
-- 	•	:G — откроет интерфейс Git.
-- 	•	:Gstatus, :Gcommit, :Gdiff, :Gpush и др. — аналогично git в терминале.
-- 	•	Работает как встроенный Git-интерфейс внутри Neovim.

-- ⸻

-- 📦 lewis6991/gitsigns.nvim

-- Описание:
-- Показывает изменения в файлах Git прямо в “gutter” слева (например, добавленные/удалённые строки), а также даёт горячие клавиши для действий с хунками.

-- Как использовать:
-- 	•	🧾 :Gitsigns preview_hunk (<leader>gp) — предпросмотр изменений в текущем хунке.
-- 	•	👤 :Gitsigns toggle_current_line_blame (<leader>gb) — включить/выключить blame на текущей строке.
-- 	•	Визуальные индикаторы (плюсики, минусы) появляются автоматически в гуттере.

return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
		end,
	},
}
