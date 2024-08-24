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
            html = { "prettierd" },
            javascript = { "prettierd" },
            css = { "prettierd" },
        },
    },
}
