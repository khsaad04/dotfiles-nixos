local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.showmode = false
opt.cmdheight = 1
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
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
