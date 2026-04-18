-- настрйка тем для Neovim

local user_settings = require("config.user_settings")
local current_theme = user_settings.env.theme

-- Функция для определения стиля Tokyo Night из имени темы
local function get_tokyonight_style()
    if current_theme == "tokyonight-night" then
        return "night"
    elseif current_theme == "tokyonight-storm" then
        return "storm"
    elseif current_theme == "tokyonight-day" then
        return "day"
    elseif current_theme == "tokyonight-moon" then
        return "moon"
    elseif current_theme == "tokyonight" then
        return "night" -- default
    end
    return nil
end

-- Функция для установки темы, если она активная
local function setup_theme(plugin_name, setup_fn)
    return function()
        setup_fn()
        -- Устанавливаем тему только если это текущая выбранная тема
        if current_theme == plugin_name or
           current_theme:find("^" .. plugin_name .. "-") then
            vim.cmd.colorscheme(current_theme)
        end
    end
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = setup_theme("catppuccin", function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				show_end_of_buffer = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false,
				no_bold = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					notify = false,
					mini = false,
				},
			})
		end),
	},
	{
		"craftzdog/solarized-osaka.nvim",
		name = "solarized-osaka",
		lazy = false,
		priority = 1000,
        config = setup_theme("solarized-osaka", function()
            require("solarized-osaka").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
        end),
	},
	{
		"folke/tokyonight.nvim",
        name = "tokyonight",
		lazy = false,
		priority = 1000,
        config = setup_theme("tokyonight", function()
            local style = get_tokyonight_style()
            if style then
                require("tokyonight").setup({
                    style = style,
                    transparent = true,
                    styles = {
                        sidebars = "transparent",
                        floats = "transparent",
                    },
                })
            end
        end),
	},
}
