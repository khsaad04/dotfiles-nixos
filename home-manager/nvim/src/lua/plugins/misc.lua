return {
    { "tpope/vim-sleuth", event = "VeryLazy" }, -- Automatically detect and change indent size
    {
        "lukas-reineke/indent-blankline.nvim", -- Show indents
        main = "ibl",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "┊",
            },
            scope = {
                enabled = false,
            },
        },
    },
}
