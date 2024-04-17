return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- require("catppuccin").setup({
      --   transparent_background = true,
      -- })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
