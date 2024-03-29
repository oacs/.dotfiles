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
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = { enable = true },
	indent = { enable = true, disable = { "python" } },
})

require("treesitter-context").setup()
