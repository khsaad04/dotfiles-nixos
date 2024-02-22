return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
	opts = {
		indent = {
			char = "┊",
		},
		scope = {
			enabled = false,
		},
	},
}
