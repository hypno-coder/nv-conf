return {
  "tpope/vim-commentary",
  config = function()
    vim.api.nvim_command("let g:commentary#comment_delimiters = {'prisma': {'left': '//'}}")
  end
}
