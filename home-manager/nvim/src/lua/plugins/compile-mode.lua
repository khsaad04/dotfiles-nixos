return {
    "ej-shafran/compile-mode.nvim",
    cmd = "Compile",
    keys = {
        {
            "<leader>cr",
            vim.cmd.Recompile,
            mode = "n",
            desc = "[C]ompile mode [R]ecompile",
        },
        {
            "<leader>cn",
            vim.cmd.NextError,
            mode = "n",
            desc = "Go to [C]ompile mode [N]ext error",
        },
        {
            "<leader>cp",
            vim.cmd.PrevError,
            mode = "n",
            desc = "Go to [C]ompile mode [P]revious error",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "m00qek/baleia.nvim",
    },
    config = function()
        vim.g.compile_mode = {
            default_command = "",
            baleia_setup = true,
        }
    end,
}
