return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
		require("catppuccin").setup({
			flavor = "mocha",
			integrations = {
				cmp = true,
				gitsigns = true,
				neotree = true,
				treesitter = true,
				notify = true,
				noice = true,
			},
		})
	end,
}
