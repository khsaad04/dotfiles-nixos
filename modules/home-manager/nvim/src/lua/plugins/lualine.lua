return {
  "nvim-lualine/lualine.nvim",
  priority = 999,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
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
