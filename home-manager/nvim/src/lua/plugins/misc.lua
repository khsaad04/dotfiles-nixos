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
    {
        "j-hui/fidget.nvim", -- Loading animation fidget thingy
        event = "VeryLazy",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    },
    {
        "folke/which-key.nvim", -- Show which key I'm pressing
        event = "VeryLazy",
        opts = {},
    },
}
