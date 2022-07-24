local nnoremap = require("keymap").nnoremap
-- Terminal commands
nnoremap("<leader>th", ':lua require("harpoon.term").gotoTerminal(1)<CR>')
nnoremap("<leader>tt", ':lua require("harpoon.term").gotoTerminal(2)<CR>')
nnoremap("<leader>tm", ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')
nnoremap("<leader>tn", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
nnoremap("<leader>ta", ':lua require("harpoon.mark").add_file()<CR>')
nnoremap("<leader>ts", ':lua require("harpoon.term").sendCommand(1, 1)<CR>')
