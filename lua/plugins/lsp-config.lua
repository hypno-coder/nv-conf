-- mason это пакетный менеджер для lsp серверов, mason-lspconfig это прокладка
-- для соедениея mason и nvim-lsp&
-- в mason-lspconfig мы указываем какие lsp установить
-- а в nvim-lspconfig мы активируем эти slp, и они начинают общатся с серверами
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "dockerls",
                    "docker_compose_language_service",
                    "sqlls",
                    "cssls",
                    "stylelint_lsp",
                    "jsonls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.lsp.config('rust_analyzer', {
              settings = {
                ['lua_ls'] = {},
                ['pyright'] = {},
                ['dockerls'] = {},
                ['docker_compose_language_service'] = {},
                ['sqlls'] = {},
                ['cssls'] = {},
                ['stylelint_lsp'] = {},
                ['jsonls'] = {},
              },
            })
        end,
    }
}
