local nnoremap = require("keymap").nnoremapwdesc("[N]eorg: ")

nnoremap("<leader>nm", ":Neorg inject-metadata<CR>", "Insert [M]etadata")
nnoremap("<leader>no", ":Neorg<CR>", "[O]org")
nnoremap("<leader>nj", ":Neorg journal today<CR>", "[J]ournal")
nnoremap("<leader>nb", "<Plug>(neorg.telescope.backlinks.file_backlinks)", "[S]earch")
nnoremap("<leader>nB", "<Plug>(neorg.telescope.backlinks.header_backlinks)", "[S]earch")
nnoremap("<leader>nl", "<Plug>(neorg.telescope.find_linkable)", "[S]earch")
nnoremap("<leader>ns", "<Plug>(neorg.telescope.search_headings)", "[S]earch")
nnoremap("<leader>nS", "<Plug>(neorg.telescope.find_norg_files)", "[S]earch")
nnoremap("<leader>nif", "<Plug>(neorg.telescope.insert_file_link)", "[S]earch")
nnoremap("<leader>nil", "<Plug>(neorg.telescope.insert_link)", "[S]earch")
nnoremap("<leader>nw", "<Plug>(neorg.telescope.switch_workspace)", "[S]earch")
-- nnoremap("<leader>cm", "<Plug>(neorg.looking-glass.magnify-code-block)", "")
nnoremap("<leader>id", "<Plug>(neorg.tempus.insert-date)", "[I]nsert [D]ate")
nnoremap("<leader>li", "<Plug>(neorg.pivot.list.invert)", "[L]ist [I]nverse")
nnoremap("<leader>lt", "<Plug>(neorg.pivot.list.toggle)", "[L]ist [T]oggle")
nnoremap("<leader>na", "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)", "[A]mbiguos")
nnoremap("<leader>nc", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", "[C]ancelled")
nnoremap("<leader>nd", "<Plug>(neorg.qol.todo-items.todo.task-done)", "[D]one")
nnoremap("<leader>nh", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", "[H]old")
nnoremap("<leader>ni", "<Plug>(neorg.qol.todo-items.todo.task-important)", "[I]mportant")
nnoremap("<leader>np", "<Plug>(neorg.qol.todo-items.todo.task-pending)", "[P]ending")
nnoremap("<leader>nr", "<Plug>(neorg.qol.todo-items.todo.task-recurring)", "[R]ecurring")
nnoremap("<leader>nu", "<Plug>(neorg.qol.todo-items.todo.task-undone)", "[U]ndone")

return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	dependencies = {
		{
			"juniorsundar/neorg-extras",
			-- tag = "v0.3.1" -- Always a safe bet to track current latest release
		},
		"nvim-telescope/telescope.nvim", -- Required for the Neorg-Roam features
		"nvim-lua/plenary.nvim", -- Required as part of Telescope installation
		{ "nvim-neorg/neorg-telescope" },
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.journal"] = {
					config = {
						strategy = "flat",
					},
				}, -- Adds pretty icons to your documents
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							default = "~/dev/notes",
						},
					},
				},
				["core.integrations.telescope"] = {
					config = {
						insert_file_link = {
							-- Whether to show the title preview in telescope. Affects performance with a large
							-- number of files.
							show_title_preview = true,
						},
					},
				},
				["external.agenda"] = {}, -- OPTIONAL if you don't want the agenda features
				-- MANDATORY and if you're a 50-cent fan
				["external.many-mans"] = {
					config = {
						treesitter_fold = true, -- If you don't want @data property ... @end to fold
					},
				},
			},
		})
		require("neorg.core").modules.get_module("core.dirman").set_workspace("default")
	end,
}
