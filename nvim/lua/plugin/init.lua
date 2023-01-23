require("plugin.cmp")
require("plugin.harpoon")
require("plugin.lualine")
require("plugin.notes")
require("plugin.treesitter")
require("plugin.tmux")
require("plugin.telescope")
--require("plugin.vimWiki")
require("nvim-surround").setup()
require("fidget").setup({ text = {
	spinner = "moon",
} })
require("lualine").setup({
	options = {
		theme = "gruvbox-material",
	},
})
