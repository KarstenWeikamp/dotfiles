-- init.lua

vim.g.mapleader = " "

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("config.plugins")

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.colorcolumn = "79"
vim.opt.list = true

vim.opt.listchars = {
  tab = "▸ ",       -- show tabs as a right-pointing triangle followed by a space
  trail = "·",      -- show trailing spaces as a middle dot
  extends = ">",    -- show when line extends beyond screen as >
  precedes = "<",   -- show when line continues from the left as <
  nbsp = "+"        -- show non-breaking space as +
}
     

