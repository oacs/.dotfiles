require("plugin")
---@diagnostic disable-next-line: unused-local
local function on_attach()
	-- TODO: TJ told me to do this and I should do it because he is Telescopic
	-- "Big Tech" "Cash Money" Johnson
end

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

require("nvim-treesitter.install").compilers = { "tsserver", "vuels" }

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"comment",
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
