local nnoremap = require("keymap").nnoremap
local desc = function(desc)
	if desc then
		desc = "HP: " .. desc
	end
	return { desc = desc }
end

local clear_all_marks = function()
	require("harpoon").get_mark_config().marks = {}
end

local go_to_terminal = function(pos)
	return function()
		require("harpoon.term").gotoTerminal(pos)
	end
end

local send_command = function()
	require("harpoon.term").sendCommand(1, 1)
end

-- Harpoon quick terminal jumps
return {
	"ThePrimeagen/harpoon",
	config = function()
		-- Terminal commands
		nnoremap("<leader>th", go_to_terminal(1), desc("[TH]erminal secondary"))
		nnoremap("<leader>tt", go_to_terminal(2), desc("[TT]erminal main"))
		nnoremap("<leader>tc", require("harpoon.cmd-ui").toggle_quick_menu, desc("[T]erminal [C]ommands"))
		nnoremap("<leader>ts", send_command, desc("[T]erminal [S]end command"))
		nnoremap("<leader>hm", require("harpoon.ui").toggle_quick_menu, desc("[H]arpoon [M]enu"))
		nnoremap("<leader>ha", require("harpoon.mark").add_file, desc("[H]arpoon [A]dd"))
		nnoremap("<leader>hc", clear_all_marks, desc("[H]arpoon [C]lear"))
		nnoremap("<leader>hn", require("harpoon.ui").nav_next, desc("[H]arpoon [N]ext")) -- navigates to next mark
		nnoremap("<leader>hp", require("harpoon.ui").nav_prev, desc("[H]arpoon [P]revious")) -- navigates to previous mark
	end,
}
