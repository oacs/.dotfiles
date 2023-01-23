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
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
