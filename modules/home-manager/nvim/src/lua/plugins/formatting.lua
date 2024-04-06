return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format current buffer using conform-nvim",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      c = { "clang-format" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
