require("nvim-treesitter.configs").setup({
	ensure_installed = {
		-- Web development
		"html",
		"css",
		"javascript",
		"json",
		"graphql",
		"typescript",
		"tsx",
		"comment",
		"vue",
		"prisma",

		-- Others
		"bash",
		"rust",
		"go",
		"lua",
		"regex",
		"dockerfile",
		"markdown",
	},
	auto_install = true,
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = { enable = true },
	indent = { enable = true, disable = { "python" } },
})
