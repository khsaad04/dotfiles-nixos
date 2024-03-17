return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  -- 	"RRethy/base16-nvim",
  -- 	priority = 1000,
  -- 	config = function()
  -- 		vim.cmd.colorscheme("base16-kanagawa")
  -- 	end,
  -- },
}
