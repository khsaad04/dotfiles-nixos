vim.cmd.colorscheme("catppuccin")
require("catppuccin").setup({
	flavor = "mocha",
	background = { dark = "mocha" },

	integrations = {
		cmp = true,
		gitsigns = true,
		neotree = true,
		treesitter = true,
		notify = true,
		noice = true,
	},
})
