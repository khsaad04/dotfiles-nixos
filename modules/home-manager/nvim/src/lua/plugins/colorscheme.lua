return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        default_integrations = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          indent_blankline = {
            enabled = true,
            scope_color = "",
            colored_indent_levels = false,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          fidget = true,
          neotree = true,
          telescope = { enabled = true },
          treesitter = true,
          treesitter_context = true,
          semantic_tokens = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
