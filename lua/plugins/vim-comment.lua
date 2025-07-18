-- плагин для коментирования кода в Neovim

return {
  "terrortylor/nvim-comment",
  lazy = false,
  config = function()
    require("nvim_comment").setup({
      comment_empty = false, -- не комментировать пустые строки
      create_mappings = true, -- создать стандартные сочетания клавиш
    })
  end,
}
