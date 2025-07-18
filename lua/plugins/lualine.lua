
-- Описание:
-- Лёгкий и настраиваемый статусбар (statusline) для Neovim, написанный на Lua. Заменяет стандартную строку состояния на информативную и красивую.

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            options = {
                theme = "material"
            }
        })
    end
}
