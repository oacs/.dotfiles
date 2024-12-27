local Job = require("plenary.job")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")
local scan = require("plenary.scandir")
local M = {}

M.search_todos = function()
	require("telescope.builtin").grep_string({
		use_regex = true,
		search = "[T|t][O|o][D|d][O|o]([S|s]?)|(@?[O|o][A|a][C|c][S|s])",
	})
end

M.search_neorg_todos = function()
	require("telescope.builtin").grep_string({
		use_regex = true,
		search = "- \\( \\) ",
		search_dirs = {
			"~/dev/notes",
		},
	})
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.dotfiles",
	})
end

M.search_fc = function()
	require("telescope.builtin").find_files({
		prompt_title = "< FC >",
		cwd = "~/workspace/",
	})
end

M.search_rest = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Rest >",
		cwd = "~/workspace/apiCalls/",
	})
end

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
return M
