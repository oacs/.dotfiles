
local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap
local desc = function(desc)
	if desc then
		desc = "TL: " .. desc
	end
	return { desc = desc }
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"xiyaowong/telescope-emoji.nvim",
		"benfowler/telescope-luasnip.nvim",

 	-- Add yanky to copy to system clipboard
 	{
 		"gbprod/yanky.nvim",
 		opts = {},
 	},
	},
	config = function()

local M = {}
M.search_todos = function()
	require("telescope.builtin").grep_string({
		use_regex = true,
		search = "[T|t][O|o][D|d][O|o]([S|s]?)|(@?[O|o][A|a][C|c][S|s])",
	})
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.dotfiles",
	})
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local scan = require("plenary.scandir")
local Job = require("plenary.job")

M.tmux_sessions = function(opts)
	opts = opts or {}
	local dirs = scan.scan_dir("/home/oacs/dev", {
		hidden = true,
		depth = 1,
		only_dirs = true,
		selint = true,
	})
	table.insert(dirs, "/home/oacs/dev/dotfiles")
	table.insert(dirs, "/home/oacs/notes")
	pickers
		.new(opts, {
			prompt_title = "projects",
			finder = finders.new_table({
				results = dirs,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local selection_dirname = string.gsub(selection[1], ".home.oacs.dev.(.*)", "%1")
					local err = 0
					Job:new({
						command = "tmux",
						args = { "switch-client", "-t", selection_dirname },
						cwd = vim.loop.cwd(),
						on_stderr = function()
							err = 1
						end,
					}):sync()
					if err == 1 then
						Job:new({
							command = "ta",
							args = { "--path", selection },
							cwd = vim.loop.cwd(),
						}):sync()
					end
				end)
				return true
			end,
		})
		:find()
end
-- todos
-- oacs
-- @oacs
-- Todo
-- TOdo
-- TODo
-- TODO
		require("plugin.tmux")
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
		require("telescope").load_extension("harpoon")
		-- require("telescope").load_extension("dap")
		require("telescope").load_extension("yank_history")
		require("telescope").load_extension("emoji")
		require("telescope").load_extension("luasnip")
		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")

		nnoremap("<leader>p", ":Telescope yank_history<cr>", desc("[P]aste history"))
		vnoremap("<leader>p", "d:Telescope yank_history<cr>", desc("[P]aste history + <C-k>"))

		nnoremap("<leader>sS", require("telescope.builtin").find_files, desc("[SS]earch files"))

		nnoremap("<leader>ss", require("telescope.builtin").git_files, desc("[SS]earch files"))
		vnoremap("<leader>ss", "y<ESC>:Telescope find_files default_text=<c-r>0<CR>", desc("[SS]earch files (ALL)"))

		nnoremap("<leader>sd", require("telescope.builtin").diagnostics, desc("[S]earch [D]iagnostics"))

		nnoremap("<leader>sw", require("telescope.builtin").grep_string, desc("[S]earch [W]ord"))
		nnoremap("<leader>sg", require("telescope.builtin").live_grep, desc("[S]earch [G]rep"))
		vnoremap("<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", desc("[S]earch [G]rep"))

		nnoremap("<leader>sb", require("telescope.builtin").buffers, desc("[S]earch [B]uffers"))

		nnoremap("<leader>sh", require("telescope.builtin").help_tags, desc("[S]earch [H]elp tags"))
		vnoremap("<leader>sh", "y<ESC>:Telescope help_tags default_text=<c-r>0<CR>", desc("[S]earch [H]elp tags"))

		nnoremap("<leader>sr", require("telescope.builtin").registers, desc("[S]earch [R]egisters"))
		nnoremap("<leader><leader>e", ":Telescope emoji<cr>", desc("[S]earch [E]moji"))
		nnoremap("<leader>sn", ":Telescope luasnip<cr>", desc("[S]earch S[n]ippet"))
		nnoremap("<leader>hs", ":Telescope harpoon marks<cr>", desc("[H]arpoon [S]earch"))
		-- nnoremap("<leader>ft", M.search_todos)
		nnoremap("<leader>sq", require("telescope.builtin").quickfix, desc("[S]earch [Q]uickfix"))

		-- nnoremap("<leader>gw", require('telescope').extensions.git_worktree.git_worktrees)
		nnoremap("<leader>gs", require("telescope.builtin").git_branches, desc("[G]it [S]earch"))
		nnoremap("<leader>gS", require("telescope.builtin").git_stash, desc("[G]it [S]tash"))

		nnoremap("<leader>sT", require("telescope.builtin").treesitter, desc("[S]earch [T]reesitter"))

		nnoremap("<leader>st", M.tmux_sessions, desc("[S]earch [T]mux Session"))
		nnoremap("<leader>sD", M.search_dotfiles, desc("[S]earch [D]otfiles"))
		nnoremap("<leader>sc", require("telescope.builtin").commands, desc("[S]earch [C]ommands"))
		nnoremap("<leader>sC", require("telescope.builtin").command_history, desc("[S]earch [C]ommands"))

		-- nnoremap("<leader>sl", require("telescope.builtin").loclist, desc("[S]earch [L]oclist"))
		nnoremap("<leader>sl", require("telescope.builtin").loclist, desc("[S]earch [L]oclist"))
		nnoremap("<leader>sk", require("telescope.builtin").keymaps, desc("[S]earch [K]eymaps"))
	end,
}
