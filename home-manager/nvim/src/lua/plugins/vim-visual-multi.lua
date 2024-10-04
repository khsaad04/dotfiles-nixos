return {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    keys = {
        {
            "<leader>mt",
            "<Plug>(VM-Toggle-Mappings)",
            mode = "n",
            desc = "vim-visual-multi Toggle Mappings",
        },
    },
    init = function()
        vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
}
