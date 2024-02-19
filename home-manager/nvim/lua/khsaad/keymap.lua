local keymap = vim.keymap.set
local opts = { silent = true }

-- Keymaps for better default experience
keymap({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights on search
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Center cursor while navigating
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "j", "jzz", opts)
keymap("n", "k", "kzz", opts)

keymap("i", "<C-c>", "<Esc>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- greatest remap ever
keymap("x", "p", [["_dp]], opts)

-- Format
keymap("n", "<leader>lf", "<cmd>FormatCustom<cr><cmd>Format<cr>", opts)

-- Formatter for nix
keymap("n", "<leader>fn", "<cmd>%!alejandra -qq<cr>", opts)
