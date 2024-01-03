-- Bootstrap lazy
local opt = vim.opt
local g = vim.g

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
g.mapleader = " "
g.maplocalleader = " "

local bootstrap_lazy = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	opt.rtp:prepend(lazypath)
end

bootstrap_lazy()

require("lazy").setup("oacs.lazy")
