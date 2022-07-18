require("plugin")
require("vimWiki")

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"comment",
		"go",
		"css",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"regex",
		"tsx",
		"vue",
		"typescript",
	},
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
