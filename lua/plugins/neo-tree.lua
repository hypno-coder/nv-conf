return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          -- Скрываем папку __pycache__ и файлы .pyc
          hide_dotfiles = true,
          custom = { "__pycache__", "%.pyc", "venv", ".env", "*.db", ".git", ".idea" }, 
        },
      },
    })
  end
}
