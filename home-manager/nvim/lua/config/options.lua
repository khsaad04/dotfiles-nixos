vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = false

opt.mouse = "a"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true

opt.scrolloff = 999
opt.virtualedit = "block"

opt.clipboard = "unnamedplus"

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

vim.wo.signcolumn = "yes:1"

opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = "menu,menuone,noselect"

opt.termguicolors = true
opt.cmdheight = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
