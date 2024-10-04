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

local function keymap_with_desc_binding(base_desc, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(op, lhs, rhs, desc)
		vim.keymap.set(op, lhs, rhs, { desc = base_desc .. desc })
	end
end

local function keymap(op, lhs, rhs, opts)
	vim.keymap.set(op, lhs, rhs, opts)
end

local function keymap_with_desc(op, lhs, rhs, desc, opts)
	opts = vim.tbl_extend("force", { desc = desc }, opts or {})
	-- print(vim.fn.printf("op=%s", op))
	-- print(vim.fn.printf("lhs=%s", lhs))
	-- print(vim.fn.printf("rhs=%s", rhs))
	-- print(vim.fn.printf("opts=%s", opts))
	vim.keymap.set(op, lhs, rhs, opts)
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

M.keymap = keymap
M.keymap_desc = keymap_with_desc
M.keymap_with_desc = keymap_with_desc_binding

return M
