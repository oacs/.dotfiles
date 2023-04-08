local Job = require("plenary.job")
local M = {}

function M.tmux_move_to_window(number)
	local stderr = {}
	-- stdout, ret
	local _, _ = Job:new({
		command = "tmux",
		args = { "select-window", "-t:" .. number },
		cwd = "/usr/bin",
		on_stderr = function(_, data)
			table.insert(stderr, data)
		end,
	}):sync()
end

local nnoremap = require("keymap").nnoremap

nnoremap("<leader>tp", ':lua require("plugin.tmux").tmux_move_to_window("{previous}")<CR>')
nnoremap("<leader>tn", ':lua require("plugin.tmux").tmux_move_to_window("{next}")<CR>')

return M
