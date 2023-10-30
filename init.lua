-- init.lua
-- global initialization before nvchad takes over and does shenaniagans.
-- mostly we wan tto use for pre-lua vim stuffs
local set = vim.opt

set.title = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true
set.clipboard = "unnamedplus"
set.cmdheight = 1
set.ignorecase = true
set.mouse = ""
set.number = true
--  set.numberwidth = 2
set.relativenumber = false
--  ruler = false,
set.updatetime = 250

--Clean whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})