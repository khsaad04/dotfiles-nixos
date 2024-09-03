return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>si",
                    node_decremental = "<leader>sd",
                    scope_incremental = "<leader>sc",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
                        ["aa"] = { query = "@parameter.outer", desc = "around argument" },
                        ["if"] = { query = "@function.inner", desc = "inside function" },
                        ["af"] = { query = "@function.outer", desc = "around function" },
                    },
                },
            },
        })
    end,
}
