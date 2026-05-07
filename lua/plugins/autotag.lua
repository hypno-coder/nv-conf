
-- Описание:
-- Автоматически закрывает и обновляет теги в HTML, JSX, TSX и других разметках с поддержкой Tree-sitter.

-- Использование:
-- При редактировании HTML/JSX/TSX:
-- 	•	При вводе открывающего тега (<div>) автоматически добавляется закрывающий (</div>)
-- 	•	При переименовании тега — закрывающий тег обновляется автоматически.

return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
		vim.diagnostic.config({
			underline = true,
			virtual_text = { spacing = 5 },
			update_in_insert = true,
		})
	end,
}
