return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
      },
    })
  end,
}
