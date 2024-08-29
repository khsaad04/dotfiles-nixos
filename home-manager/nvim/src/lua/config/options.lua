vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.foldenable = false
opt.scrolloff = 999
opt.virtualedit = "block"
opt.mouse = "a"
vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.signcolumn = "yes"
opt.completeopt = "menuone,noselect"
opt.termguicolors = true
opt.cmdheight = 1
