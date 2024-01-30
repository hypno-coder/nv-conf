vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
	lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- подтягивает плагины из файла plugins.lua
require("lazy").setup("plugins");




