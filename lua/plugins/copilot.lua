-- ИИшечка

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",          -- Принять предложение
          next = "<M-]>",           -- Следующее предложение
          prev = "<M-[>",           -- Предыдущее
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        python = true,
        lua = true,
        javascript = true,
        typescript = true,
        markdown = true,
        html = true,
        css = true,
        json = true,
        yaml = true,
        sh = true,
        zsh = true,
        ["*"] = false, -- по умолчанию выключено
      },
    })
  end,
}
