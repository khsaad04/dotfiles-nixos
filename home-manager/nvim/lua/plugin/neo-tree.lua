vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle<cr>", { silent = true })
require("neo-tree").setup({})
