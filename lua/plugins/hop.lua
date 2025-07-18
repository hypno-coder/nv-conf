-- Описание:
-- Плагин для быстрого перемещения по тексту с помощью всплывающих подсказок. Аналог AceJump (из JetBrains IDE). Ускоряет навигацию внутри строк и между строками.

-- Как использовать (твоя текущая настройка)

-- f Прыжок вперёд к символу на текущей строке после курсора
-- F Прыжок назад к символу на текущей строке до курсора
-- t Прыжок вперёд к символу на любом месте (по всему буферу)
-- T Прыжок назад к символу на любом месте (по всему буферу)

return {
    "phaazon/hop.nvim",
    config = function()
        require("hop").setup()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        vim.keymap.set("", "f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "t", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
        end, { remap = true })
        vim.keymap.set("", "T", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
        end, { remap = true })
    end,
}
