local M = {}

local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local function bind_with_desc(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(base_desc)
		return function(lhs, rhs, desc)
			vim.keymap.set(op, lhs, rhs, { desc = base_desc .. desc })
		end
	end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.cnoremap = bind("c")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")
M.snoremap = bind("s")

M.nnoremapwdesc = bind_with_desc("n")
M.cnoremapwdesc = bind_with_desc("c")
M.vnoremapwdesc = bind_with_desc("v")
M.xnoremapwdesc = bind_with_desc("x")
M.inoremapwdesc = bind_with_desc("i")
M.tnoremapwdesc = bind_with_desc("t")
M.snoremapwdesc = bind_with_desc("s")
return M

-- TODO maybe just create map("i", "<leader>zzz", ":goToSleep<CR>") and add noremap = true as def
