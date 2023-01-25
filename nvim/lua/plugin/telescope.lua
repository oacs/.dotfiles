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
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

nnoremap("<leader>p", ":Telescope yank_history<cr>")
nnoremap("<leader>sS", require("telescope.builtin").git_files)
nnoremap("<leader>ss", require("telescope.builtin").find_files)
nnoremap("<leader>sg", require("telescope.builtin").live_grep)
nnoremap("<leader>sd", require("telescope.builtin").diagnostics)
nnoremap("<leader>sw", require("telescope.builtin").grep_string)
vnoremap("<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>")
nnoremap("<leader>sb", require("telescope.builtin").buffers)
nnoremap("<leader>sh", require("telescope.builtin").help_tags)
vnoremap("<leader>sh", "y<ESC>:Telescope help_tags default_text=<c-r>0<CR>")
nnoremap("<leader>sr", require("telescope.builtin").registers)
-- nnoremap("<leader>ft", require('plugin.custom_telescope').search_todos)
nnoremap("<leader>sq", require("telescope.builtin").quickfix)

-- nnoremap("<leader>gw", require('telescope').extensions.git_worktree.git_worktrees)
nnoremap("<leader>gs", require("telescope.builtin").git_branches)
nnoremap("<leader>gS", require("telescope.builtin").git_stash)

nnoremap("<leader>sT", require("telescope.builtin").treesitter)

nnoremap("<leader>st", require("plugin.custom_telescope").tmux_sessions)
nnoremap("<leader>sD", require("plugin.custom_telescope").search_dotfiles)
