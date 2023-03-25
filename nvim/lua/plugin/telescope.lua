local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap
local desc = function(desc)
	if desc then
		desc = "TL: " .. desc
	end
	return { desc = desc }
end

-- This is your opts table
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("dap")
require("telescope").load_extension("yank_history")
require("telescope").load_extension("emoji")
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

nnoremap("<leader>p", ":Telescope yank_history<cr>", desc("[P]aste history"))
vnoremap("<leader>p", "d:Telescope yank_history<cr>", desc("[P]aste history + <C-k>"))

nnoremap("<leader>sS", require("telescope.builtin").git_files, desc("[SS]earch files"))

nnoremap("<leader>ss", require("telescope.builtin").find_files, desc("[SS]earch files"))
vnoremap("<leader>ss", "y<ESC>:Telescope find_files default_text=<c-r>0<CR>", desc("[SS]earch files"))

nnoremap("<leader>sd", require("telescope.builtin").diagnostics, desc("[S]earch [D]iagnostics"))

nnoremap("<leader>sw", require("telescope.builtin").grep_string, desc("[S]earch [W]ord"))
nnoremap("<leader>sg", require("telescope.builtin").live_grep, desc("[S]earch [G]rep"))
vnoremap("<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", desc("[S]earch [G]rep"))

nnoremap("<leader>sb", require("telescope.builtin").buffers, desc("[S]earch [B]uffers"))

nnoremap("<leader>sh", require("telescope.builtin").help_tags, desc("[S]earch [H]elp tags"))
vnoremap("<leader>sh", "y<ESC>:Telescope help_tags default_text=<c-r>0<CR>", desc("[S]earch [H]elp tags"))

nnoremap("<leader>sr", require("telescope.builtin").registers, desc("[S]earch [R]egisters"))
nnoremap("<leader><leader>e", ":Telescope emoji<cr>", desc("[S]earch [E]moji"))
-- nnoremap("<leader>ft", require('plugin.custom_telescope').search_todos)
nnoremap("<leader>sq", require("telescope.builtin").quickfix, desc("[S]earch [Q]uickfix"))

-- nnoremap("<leader>gw", require('telescope').extensions.git_worktree.git_worktrees)
nnoremap("<leader>gs", require("telescope.builtin").git_branches, desc("[G]it [S]earch"))
nnoremap("<leader>gS", require("telescope.builtin").git_stash, desc("[G]it [S]tash"))

nnoremap("<leader>sT", require("telescope.builtin").treesitter, desc("[S]earch [T]reesitter"))

nnoremap("<leader>st", require("plugin.custom_telescope").tmux_sessions, desc("[S]earch [T]mux Session"))
nnoremap("<leader>sD", require("plugin.custom_telescope").search_dotfiles, desc("[S]earch [D]otfiles"))
nnoremap("<leader>sc", require("telescope.builtin").commands, desc("[S]earch [C]ommands"))
nnoremap("<leader>sC", require("telescope.builtin").command_history, desc("[S]earch [C]ommands"))

nnoremap("<leader>sl", require("telescope.builtin").loclist, desc("[S]earch [L]oclist"))
nnoremap("<leader>sk", require("telescope.builtin").keymaps, desc("[S]earch [K]eymaps"))
