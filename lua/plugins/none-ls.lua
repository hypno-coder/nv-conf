-- предназначен для предоставления функциональности (LSP) без необходимости установки
-- и настройки традиционных LSP серверов.
-- короче если у языка нет нормальной поддержки через LSP, то можно попробовать через none-ls
-- ну и короче я пробую формат настраивать через none-ls 
-- после установки здесь нужно установить и в Mason

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Web
        null_ls.builtins.formatting.prettierd,

        -- Go
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.gofmt, -- можешь включить, если хочешь просто gofmt
        -- null_ls.builtins.diagnostics.revive, -- линтер от go

        -- Пример доп. линтера
        -- null_ls.builtins.diagnostics.staticcheck,
      },
    })
  end,
}

