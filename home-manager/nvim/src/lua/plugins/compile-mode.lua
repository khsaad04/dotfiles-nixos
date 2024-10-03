return {
    "ej-shafran/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "m00qek/baleia.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>n", "<cmd>NextError<cr>", { desc = "Go to [N]ext error in compile mode" })
        vim.keymap.set("n", "<leader>p", "<cmd>PrevError<cr>", { desc = "Go to [P]revious error in compile mode" })
        vim.g.compile_mode = {
            baleia_setup = true,
        }
    end,
}
