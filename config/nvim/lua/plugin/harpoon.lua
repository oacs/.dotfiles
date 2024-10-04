local M = {}

M.clear_all_marks = function()
	require("harpoon").get_mark_config().marks = {}
end

M.go_to_terminal = function(pos)
	return function()
		require("harpoon.term").gotoTerminal(pos)
	end
end

M.send_command = function()
	require("harpoon.term").sendCommand(1, 1)
end

return M
