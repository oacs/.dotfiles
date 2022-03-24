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

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	indent = { enable = true },
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})

require("nvim-biscuits").setup({
	toggle_keybind = "<leader>bt",
	default_config = {
		disabled = true,
		max_length = 12,
		min_distance = 5,
		prefix_string = " 📎 ",
	},
	language_config = {
		html = {
			prefix_string = " 🌐 ",
		},
		javascript = {
			prefix_string = " ✨ ",
			max_length = 80,
		},
	},
})
require("symbols-outline").setup(opts)

require("nvim-treesitter.install").compilers = { "tsserver", "vuels", "lua", "gopls" }

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

require('Comment').setup()
