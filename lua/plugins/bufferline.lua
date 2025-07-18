-- Плагин отображает открытые буферы в виде вкладок в верхней части 
-- окна Neovim — как в классических редакторах кода (VS Code, Sublime и др.).

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				buffer_close_icon = "†",
                show_buffer_icons = false,
				mode = "buffers",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						separator = true,
						padding = 1,
					},
				},
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
