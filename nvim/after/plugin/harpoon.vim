" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <leader>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cj :lua require("harpoon.term").sendCommand(1, "npm start")<CR>
nnoremap <leader>ck :lua require("harpoon.term").sendCommand(1, "npm run dev:broker:local")<CR>
