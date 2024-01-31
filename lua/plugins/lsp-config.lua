-- mason это пакетный менеджер для lsp серверов, mason-lspconfig это прокладка
-- для соедениея mason и nvim-lsp&
-- в mason-lspconfig мы указываем какие lsp установить
-- а в nvim-lspconfig мы активируем эти slp, и они начинают общатся с серверами 
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "pyright",
                    "rust_analyzer",
                    "dockerls",
                    "docker_compose_language_service",
                    "sqlls",
                    "cssls",
                    "stylelint_lsp",
                    "jsonls",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.pyright.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.stylelint_lsp.setup({})
            lspconfig.jsonls.setup({})
        end
    }
}
