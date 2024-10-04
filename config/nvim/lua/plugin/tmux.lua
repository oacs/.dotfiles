local Job = require("plenary.job")
local M = {}

function M.tmux_move_to_window(number)
	return function()
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
end

return M
