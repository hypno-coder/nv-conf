-- Описание:
-- Это основной фреймворк отладки (Debug Adapter Protocol) для Neovim. Он позволяет запускать и управлять сессиями отладки прямо из редактора.

-- Инструкция по использованию:

-- 📌 Основные клавиши:
-- 	•	<Leader>db — поставить/снять брейкпоинт
-- 	•	<Leader>dB — поставить брейкпоинт с условием
-- 	•	<Leader>dc — продолжить выполнение программы

-- НАВЕРНО НУЖНО ДОРАБОТАТЬ:

return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "microsoft/vscode-js-debug",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        require("dapui").setup()
        require("dap-python").setup()
        require("dap-go").setup()

        dap.adapters.node2 = {
            type = "executable",
            command = "node",
            args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
        }

        dap.configurations.typescript = {
            {
                name = "Launch",
                type = "node2",
                request = "launch",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
            },
        }

        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
