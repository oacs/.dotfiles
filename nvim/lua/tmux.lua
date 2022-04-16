local Job = require("plenary.job")
local M = {}

function M.tmux_move_to_window(number)
	local stderr = {}
	-- stdout, ret
	local _, _ = Job
		:new({
			command = "tmux",
			args = { "select-window", "-t:" .. number },
			cwd = "/usr/bin",
			on_stderr = function(_, data)
				table.insert(stderr, data)
			end,
		})
		:sync()
end

local map = function(mode, lhf, rhf)
	vim.api.nvim_set_keymap(mode, lhf, rhf, { noremap = true })
end

map("n", "<leader>tu", ':lua require("tmux").tmux_move_to_window("{previous}")<CR>')
map("n", "<leader>ti", ':lua require("tmux").tmux_move_to_window("{next}")<CR>')
return M
