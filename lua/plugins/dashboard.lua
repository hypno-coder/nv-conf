-- Dashboard — плагин для кастомного стартового экрана в Neovim.

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({

            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        icon = "󰊳  ",
                        icon_hl = "@variable",
                        desc = "Update Plugin",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = "  ",
                        icon_hl = "@variable",
                        desc = "Find Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        icon = "  ",
                        icon_hl = "@variable",
                        desc = "File System",
                        group = "Label",
                        action = ":Neotree float focus",
                        key = "e",
                    },
                },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
