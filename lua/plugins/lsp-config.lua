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
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.config("pyright", {
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic", --strict / basic / off
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            vim.lsp.config("dockerls", {
                settings = {
                    docker = {
                        languageserver = {
                            diagnostics = {
                                deprecatedMaintainer = "ignore",
                                instructionJSONInSingleQuotes = "error",
                            },
                            formatter = {
                                ignoreMultilineInstructions = false,
                            },
                        },
                    },
                },
            })

            vim.lsp.config("docker_compose_language_service", {})

            vim.lsp.config("sqlls", {
                settings = {
                    sqlLanguageServer = {
                        connections = {
                            {
                                name = "LocalMySQL",
                                adapter = "mysql",
                                host = "127.0.0.1",
                                port = 3306,
                                user = "root",
                                password = "secret",
                                database = "my_database",
                            },
                        },
                        lint = {
                            rules = {
                                ["reserved-word-case"] = { "error", "upper" },
                                ["align-column-to-the-first"] = "error",
                                ["linebreak-after-clause-keyword"] = "off",
                            },
                        },
                    },
                },
            })

            vim.lsp.config("cssls", {
                settings = {
                    css = {
                        validate = true,
                        lint = { unknownAtRules = "ignore" },
                    },
                    scss = {
                        validate = true,
                        lint = { unknownAtRules = "ignore" },
                    },
                    less = {
                        validate = true,
                        lint = { unknownAtRules = "ignore" },
                    },
                },
            })

            vim.lsp.config("stylelint_lsp", {
                settings = {
                    stylelint = {
                        validate = { "css", "scss", "less" },
                        customSyntax = "postcss-scss",
                        ignoreDisables = false,
                    },
                },
            })

            vim.lsp.config("jsonls", {
                settings = {
                    json = {
                        validate = { enable = true },
                        format = { enable = true },
                    },
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local bufnr = args.buf
                    -- Настройка визуального оформления подсветки ошибок
                    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" })
                    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#ffaa00" })
                    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#00aaff" })
                    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#cccccc" })

                    -- Конфигурация отображения диагностик
                    vim.diagnostic.config({
                        virtual_text = true,
                        signs = true,
                        underline = true,
                        update_in_insert = false,
                        severity_sort = true,
                    })
                end,
            })

            -- Активация серверов
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pyright")
            vim.lsp.enable("dockerls")
            vim.lsp.enable("docker_compose_language_service")
            vim.lsp.enable("sqlls")
            vim.lsp.enable("cssls")
            vim.lsp.enable("stylelint_lsp")
            vim.lsp.enable("jsonls")
        end,
    },
}
