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
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.eslint,
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettierd,
      },
    })
  end,
}


