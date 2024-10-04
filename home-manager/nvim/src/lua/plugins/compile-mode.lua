return {
    "ej-shafran/compile-mode.nvim",
    event = { "CmdlineEnter" },
    keys = {
        {
            "<leader>n",
            vim.cmd.NextError,
            mode = "n",
            desc = "Go to [N]ext error in compile mode",
        },
        {
            "<leader>p",
            vim.cmd.PrevError,
            mode = "n",
            desc = "Go to [P]revious error in compile mode",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.g.compile_mode = {
            default_command = "",
        }
    end,
}
