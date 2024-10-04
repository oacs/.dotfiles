local map = require("keymap").keymap_desc
local M = {}

-- [G]it module
M.add_git_maps = function()
  map("n","<leader>gg", ":G<CR>", "[GG]it center")
  map("n","<leader>g<leader>", ":G ", "[G]it ")
  map("n","<leader>gp", ":G push<CR>", "[G]it [P]ush")
  map("n","<leader>ga", ":G hola beto %<CR>", "[G]it [A]dd")
  map("n","<leader>gr", ":G restore %<CR>", "[G]it [R]estore")
  map("n","<leader>gc", ":G commit<CR>", "[G]it [C]ommit")
  map("n","<leader>gP", ":G push -f<CR>", "[G]it [P]ush force")
  map("n","<leader>gu", ":G pull<CR>", "[G]it [U]pdate (pull)")
  map("n","<leader>gf", ":G fetch<CR>", "[G]it [F]etch")
  map("n","<leader>gb", ":G checkout -b ", "[G]it Checkout [B]ranch")
  map("n","<leader>gn", ":diffget //3<CR>", "[G]it grab head")
  map("n","<leader>go", ":diffget //2<CR>", "[G]it grab incoming")
end

-- [T]elescope Module
M.add_telescope_maps = function()
local customTelescope = require("plugin.telescope")
map("n","<leader>sS", require("telescope.builtin").find_files, "[SS]earch files")
map("n","<leader>ss", require("telescope.builtin").git_files, "[SS]earch files")
map("v","<leader>ss", "y<ESC>:Telescope find_files default_text=<c-r>0<CR>", "[SS]earch files (ALL")
map("n","<leader>sd", require("telescope.builtin").diagnostics, "[S]earch [D]iagnostics")
map("n","<leader>sw", require("telescope.builtin").grep_string, "[S]earch [W]ord")
map("n","<leader>sg", require("telescope.builtin").live_grep, "[S]earch [G]rep")
map("v","<leader>sg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", "[S]earch [G]rep")
map("n","<leader>sb", require("telescope.builtin").buffers, "[S]earch [B]uffers")
map("n","<leader>sh", require("telescope.builtin").help_tags, "[S]earch [H]elp tags")
map("v","<leader>sh", "y<ESC>:Telescope help_tags default_text=<c-r>0<CR>", "[S]earch [H]elp tags")
map("n","<leader>sr", require("telescope.builtin").registers, "[S]earch [R]egisters")
map("n","<leader>sn", ":Telescope luasnip<cr>", "[S]earch S[n]ippet")
map("n","<leader>sp", customTelescope.search_neorg_todos, "[S]earch [P]ending tasks")
map("n","<leader>sq", require("telescope.builtin").quickfix, "[S]earch [Q]uickfix")
map("n","<leader>sT", require("telescope.builtin").treesitter, "[S]earch [T]reesitter")
map("n","<leader>st", customTelescope.tmux_sessions, "[S]earch [T]mux Session")
map("n","<leader>sD", customTelescope.search_dotfiles, "[S]earch [D]otfiles")
map("n","<leader>sc", require("telescope.builtin").commands, "[S]earch [C]ommands")
map("n","<leader>sC", require("telescope.builtin").command_history, "[S]earch [C]ommands")
map("n","<leader>sl", require("telescope.builtin").loclist, "[S]earch [L]oclist")
map("n","<leader>sl", require("telescope.builtin").loclist, "[S]earch [L]oclist")
map("n","<leader>sk", require("telescope.builtin").keymaps, "[S]earch [K]eymaps")

map("n","<leader><leader>e", ":Telescope emoji<cr>", "[S]earch [E]moji")
map("n","<leader>hs", ":Telescope harpoon marks<cr>", "[H]arpoon [S]earch")
map("n","<leader>ft", customTelescope.search_todos)
-- map("n","<leader>gw", require('telescope').extensions.git_worktree.git_worktrees)
map("n","<leader>gs", require("telescope.builtin").git_branches, "[G]it [S]earch")
map("n","<leader>gS", require("telescope.builtin").git_stash, "[G]it [S]tash")
map("n","<leader>p", ":Telescope yank_history<cr>", "[P]aste history")
map("v","<leader>p", "d:Telescope yank_history<cr>", "[P]aste history + <C-k>")
map("n","<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
 -- normal("ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
end

-- Trouble Module
  M.add_trouble_maps = function()
		local trouble = require("trouble")
		map("n", "<leader>xx", trouble.toggle, "[X][X] Trouble")
		map("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, "[W]orkspace diagnostics")
		map("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, "[D]ocument [D]iagnostics")
		map("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, "[Q]uickfix")
		map("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end, "[L]oclist")
		map("n", "gR", function()
			trouble.toggle("lsp_references")
		end, "[g]o to [R]eferences")
		map("n", "<leader>xn", function()
			trouble.toggle("lsp_references")
		end, "[g]o to [R]eferences")
		map("n", "<leader>xN", function()
			trouble.toggle("lsp_references")
		end, "[g]o to [R]eferences")
		map("n", "<leader>xn", function()
			-- jump to the next item, skipping the groups
			trouble.next({ skip_groups = true, jump = true })
		end, "[N]ext")

		map("n", "<leader>xp", function()
			-- jump to the previous item, skipping the groups
			trouble.previous({ skip_groups = true, jump = true })
		end, "[P]revious")

		map("n", "<leader>x0", function()
			-- jump to the first item, skipping the groups
			trouble.first({ skip_groups = true, jump = true })
		end, "[0]First")

		map("n", "<leader>x$", function()
			-- jump to the last item, skipping the groups
			trouble.last({ skip_groups = true, jump = true })
		end, "[$]Last")
end

-- Neorg Module

M.add_neorg_maps = function()
  map("n", "<leader>nn", ":Neorg<CR>", "[O]org")
  map("n", "<leader>ni", ":Neorg index<CR>", "[I]ndex")
  map("n", "<leader>nT", ":Neorg tangle current-file<CR>", "[T]angle")
  map("n", "<leader>nt", ":Neorg toc <CR>", "[T]oc")
  map("n", "<leader>nr", ":Neorg return<CR>", "[R]eturn")
  map("n", "<leader>nm", ":Neorg inject-metadata<CR>", "Insert [M]etadata")
  map("n", "<leader>nj", ":Neorg journal today<CR>", "[J]ournal")

  map("n", "<leader>nb", "<Plug>(neorg.telescope.backlinks.file_backlinks)", "[S]earch")
  map("n", "<leader>nB", "<Plug>(neorg.telescope.backlinks.header_backlinks)", "[S]earch")

  map("n", "<leader>nl", "<Plug>(neorg.telescope.find_linkable)", "[S]earch")
  map("n", "<leader>nh", "<Plug>(neorg.telescope.search_headings)", "[S]earch")
  map("n", "<leader>ns", "<Plug>(neorg.telescope.find_norg_files)", "[S]earch")
  map("n", "<leader>nif", "<Plug>(neorg.telescope.insert_file_link)", "[S]earch")
  map("n", "<leader>nil", "<Plug>(neorg.telescope.insert_link)", "[S]earch")
  map("n", "<leader>nw", "<Plug>(neorg.telescope.switch_workspace)", "[S]earch")

  -- map("n", "<leader>cm", "<Plug>(neorg.looking-glass.magnify-code-block)", "")

  map("n", "<leader>id", "<Plug>(neorg.tempus.insert-date)", "[I]nsert [D]ate")
  map("n", "<leader>nlI", "<Plug>(neorg.pivot.list.invert)", "[L]ist [I]nverse")
  map("n", "<leader>nlt", "<Plug>(neorg.pivot.list.toggle)", "[L]ist [T]oggle")

  map("n", "<leader>nla", "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)", "[A]mbiguos")
  map("n", "<leader>nlc", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", "[C]ancelled")
  map("n", "<leader>nld", "<Plug>(neorg.qol.todo-items.todo.task-done)", "[D]one")
  map("n", "<leader>nlh", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", "[H]old")
  map("n", "<leader>nli", "<Plug>(neorg.qol.todo-items.todo.task-important)", "[I]mportant")
  map("n", "<leader>nlp", "<Plug>(neorg.qol.todo-items.todo.task-pending)", "[P]ending")
  map("n", "<leader>nlr", "<Plug>(neorg.qol.todo-items.todo.task-recurring)", "[R]ecurring")
  map("n", "<leader>nlu", "<Plug>(neorg.qol.todo-items.todo.task-undone)", "[U]ndone")
end

-- Obsidian Module
  M.add_harpoon_maps = function()
 map("n", "<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
 map("n", "<leader>ot", ":ObsidianToday<CR>", "[O]bsidian [T]oday")
end

-- Tmux Module
local tmuxCustom = require("plugin.tmux")
map("n", "<leader>tN", tmuxCustom.tmux_move_to_window("{previous}"), "[T]mux next")
map("n", "<leader>tn", tmuxCustom.tmux_move_to_window("{next}") , "[T]mux next")

-- Harpoon Module

M.add_obsidian_maps = function()
local customHarpoon = require("plugin.harpoon")
map("n", "<leader>hta", customHarpoon.go_to_terminal(1), "[TH]erminal secondary")
map("n", "<leader>hto", customHarpoon.go_to_terminal(2), "[TT]erminal main")
map("n", "<leader>htc", require("harpoon.cmd-ui").toggle_quick_menu, "[T]erminal [C]ommands")
map("n", "<leader>hts", customHarpoon.send_command, "[T]erminal [S]end command")
map("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, "[H]arpoon [M]enu")
map("n", "<leader>ha", require("harpoon.mark").add_file, "[H]arpoon [A]dd")
map("n", "<leader>hc", customHarpoon.clear_all_marks, "[H]arpoon [C]lear")
map("n", "<leader>hn", require("harpoon.ui").nav_next, "[H]arpoon [N]ext") -- navigates to next mark
map("n", "<leader>ho", require("harpoon.ui").nav_prev, "[H]arpoon [P]revious") -- navigates to previous mark
end

-- Lsp Module
  M.add_lsp_maps = function()
map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("n", "<leader>td", vim.lsp.buf.type_definition, "[T]ype [D]efinition")
map("n", "<leader>sl", vim.diagnostic.open_float, "[S]how [L]ine diagnostic")
 -- nmap("wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
 -- nmap("wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	-- nmap("<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, "[W]orkspace [L]ist Folders")
	map("m", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	map("m", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("m", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	--map("m", "<F2>", vim.lsp.buf.rename, "[R]e[n]ame")
	map("m", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	map("m", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("m", "<leader>td", vim.lsp.buf.type_definition, "[T]ype [D]efinition")
	map("m", "<leader>sl", vim.diagnostic.open_float, "[S]how [L]ine diagnostic")
	map("m", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	-- map("m", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	-- See `:help K` for why this keymap
	map("m", "K", vim.lsp.buf.hover, "Hover Documentation")
	map("m", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	map("m", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	-- nmap("<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	--vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
	--vim.lsp.buf.format()
	--end, { desc = "Format current buffer with LSP" })
end

-- Explorer Module aka Oil
  M.add_other_maps = function()
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>E", ":Oil .<CR>")

--- Delete Yank Paste
map("x", "<leader>p", '"_dP')
map("x", "<leader>p", '"_dP')
map("n", "<leader>y", '"+y')
map("v","y", '"+y')
map("n", "<leader>Y", 'gg"+yG')
map("n", "<leader>d", '"_d')
map("v","d", '"_d')
map("n", "<leader>cp", ":let @* =', 'expand(\"%\")<CR>") -- Copy file name?

map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":w<CR>")
 map("n", "<leader><C-w>", ":wq<CR>")

map("n", "<leader>m", "<c-w>")
map("n", "<leader>o", ":SymbolsOutline<CR>")

end -- end of add_other_maps
return M