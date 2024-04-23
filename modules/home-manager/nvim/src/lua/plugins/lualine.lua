return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 999,
  config = function()
    local catppuccin = require("lualine.themes.catppuccin")
    catppuccin.normal.c.bg = "#181825"
    catppuccin.inactive.c.bg = "#181825"
    require("lualine").setup({
      options = {
        theme = catppuccin,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 1 },
        },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 1 },
        },
      },
    })
  end,
}
