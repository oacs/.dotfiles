local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap

-- This is your opts table
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("yank_history")

nnoremap("<leader>p", ":Telescope yank_history<cr>")
nnoremap("<leader>sS", ":lua require('telescope.builtin').git_files()<cr>")
nnoremap("<leader>ss", ":lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>sg", ":lua require('telescope.builtin').live_grep()<cr>")
vnoremap("<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>")
nnoremap("<leader>sb", ":lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>sh", ":lua require('telescope.builtin').help_tags()<cr>")
vnoremap("<leader>sh", "y<ESC>:Telescope help_tags default_text=<c-r>0<CR>")
nnoremap("<leader>sr", ":lua require('telescope.builtin').registers()<cr>")
-- nnoremap("<leader>ft", ":lua require('plugin.custom_telescope').search_todos()<cr>")
nnoremap("<leader>sq", ":lua require('telescope.builtin').quickfix()<cr>")

-- nnoremap("<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
nnoremap("<leader>gs", ":lua require('telescope.builtin').git_branches()<CR>")
nnoremap("<leader>gS", ":lua require('telescope.builtin').git_stash()<CR>")

nnoremap("<leader>sT", ":lua require('telescope.builtin').treesitter()<cr>")

nnoremap("<leader>st", ":lua require('plugin.custom_telescope').tmux_sessions()<CR>")
nnoremap("<leader>sd", ":lua require('plugin.custom_telescope').search_dotfiles()<CR>")
