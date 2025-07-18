
-- 📦 nvim-telescope/telescope.nvim
-- Описание:
-- Мощный инструмент для поиска файлов, текста, буферов, Git-коммитов и многого другого с удобным fuzzy-поиском. Работает быстро, требует plenary.nvim.

-- 📦 nvim-telescope/telescope-ui-select.nvim
-- Описание:
-- Расширение для telescope.nvim, позволяющее заменить стандартные UI-меню Neovim (например, vim.ui.select) на красивый интерфейс Telescope.

return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}

