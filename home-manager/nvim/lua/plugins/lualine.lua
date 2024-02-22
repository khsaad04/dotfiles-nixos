return {
	"nvim-lualine/lualine.nvim",
	priority = 999,
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})
	end,
}
