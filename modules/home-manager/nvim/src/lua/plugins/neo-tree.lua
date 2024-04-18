return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<C-e>",
      "<cmd>Neotree toggle reveal=true<cr>",
      mode = "n",
      desc = "[?] Find recently opened files",
    },
  },
}
