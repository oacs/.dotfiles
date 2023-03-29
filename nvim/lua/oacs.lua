require("plugin.telescope")
require("plugin.lualine")
require("plugin.cmp")
require("plugin.harpoon")
require("plugin.tmux")
require("plugin.treesitter")

require("nvim-surround").setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "S",
		normal_cur = "Ss",
		normal_line = "SS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})

require("fidget").setup({ text = {
	spinner = "moon",
} })

-- Not Currently Recommended
require("nvim-web-devicons").setup({
	-- your personnal icons can go here (to override)
	-- you can specify color or cterm_color instead of specifying both of them
	-- DevIcon will be appended to `name`
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
})

-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })
--
-- require("copilot_cmp").setup({
-- 	clear_after_cursor = true,
-- })

require("yanky").setup({})

require("neodev").setup()

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

require("Comment").setup()

require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})

-- local null_ls = require("null-ls")

--null_ls.setup({
--sources = {
-- null_ls.builtins.formatting.prettier,
-- null_ls.builtins.formatting.stylua,
-- null_ls.builtins.diagnostics.eslint,
-- null_ls.builtins.diagnostics.eslint_d,
-- null_ls.builtins.completion.spell,
-- null_ls.builtins.code_actions.gitsigns,
--},
--})
require("nap").setup()
