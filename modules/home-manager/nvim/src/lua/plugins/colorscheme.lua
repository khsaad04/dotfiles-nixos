return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- require("catppuccin").setup({
      --   custom_highlights = function(colors)
      --     return {
      --       NeoTreeNormal = { bg = colors.mantle },
      --       NeoTreeNormalNC = { bg = colors.mantle },
      --     }
      --   end,
      --   transparent_background = true,
      --   integrations = { fidget = true },
      -- })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
