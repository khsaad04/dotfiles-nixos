return {
    "ej-shafran/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.keymap.set("n", "<C-n>", "<cmd>NextError<cr>", { desc = "Go to [N]ext error in compile mode" })
        vim.keymap.set("n", "<C-p>", "<cmd>PrevError<cr>", { desc = "Go to [P]revious error in compile mode" })
    end,
}
