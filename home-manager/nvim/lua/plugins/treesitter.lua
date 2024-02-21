return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = {
				"lua",
				"python",
				"rust",
				"vimdoc",
				"vim",
				"regex",
				"markdown",
				"bash",
				"markdown_inline",
			},

			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
	end,
}
