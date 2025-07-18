-- тут какая-то ебанутая и запутаная настройка автозаполнения / автозавершения / снипетов
-- и другой подобной хуеты в комбинации из 4 плагинов которые взамодействуют друг с другом и с LSP
--
--
-- Описание:
-- Это набор плагинов, отвечающих за автодополнение (completion) и сниппеты в Neovim:

-- 1. hrsh7th/cmp-nvim-lsp
-- Подключает LSP-серверы как источник автодополнений для nvim-cmp.

-- 2. L3MON4D3/LuaSnip
-- Мощный движок сниппетов, поддерживает вложенные сниппеты, автотриггеры и переменные.
-- 🔌 Зависимости:
-- 	•	saadparwaiz1/cmp_luasnip — добавляет LuaSnip как источник в nvim-cmp.
-- 	•	rafamadriz/friendly-snippets — готовые сниппеты для множества языков (VSCode-совместимые).

-- 3. hrsh7th/nvim-cmp
-- Главный плагин для автодополнения в Neovim.
-- Возможности:
-- Дополнение из LSP, буфера, сниппетов и др.
-- Поддержка кастомных источников.
-- Красивые окна с обводкой (bordered).

-- Клавиши:
-- "<C-Space>" — вручную вызвать автодополнение.
-- "<CR>" — принять выбранный вариант.
-- "<C-b>" / "<C-f>" — прокрутка документации.
-- "<C-e>" — отменить/закрыть меню.

return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
