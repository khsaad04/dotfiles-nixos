return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    keys = {
        {
            "<leader>mp",
            "<Plug>(VM-Add-Cursor-At-Pos)",
            mode = "n",
            desc = "vim-visual-multi add cursor at position",
        },
        {
            "<leader>mv",
            "<Plug>(VM-Visual-Add)",
            mode = { "x", "v" },
            desc = "vim-visual-multi add cursor at position",
        },
        {
            "<leader>mr",
            "<Plug>(VM-Start-Regex-Search)",
            mode = "n",
            desc = "vim-visual-multi start regex search",
        },
        {
            "<leader>ma",
            "<Plug>(VM-Select-All)<Tab>",
            mode = "n",
            desc = "vim-visual-multi select all occurances",
        },
        {
            "<leader>mt",
            "<Plug>(VM-Toggle-Mappings)",
            mode = "n",
            desc = "vim-visual-multi toggle mappings",
        },
    },
    init = function()
        vim.g.VM_default_mappings = 0
        vim.g.VM_maps = {
            ["Find Under"] = "<leader>mn",
        }
        vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
}
