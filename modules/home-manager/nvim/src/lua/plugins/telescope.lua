return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  keys = {
    {
      "<leader>?",
      function()
        require("telescope.builtin").oldfiles()
      end,
      mode = "n",
      desc = "[?] Find recently opened files",
    },
    {
      "<leader><space>",
      function()
        require("telescope.builtin").buffers()
      end,
      mode = "n",
      desc = "[ ] Find existing buffers",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      mode = "n",
      desc = "[/] Fuzzily search in current buffer",
    },
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files()
      end,
      mode = "n",
      desc = "Search [G]it [F]iles",
    },
    {
      "<leader>sf",
      function()
        require("telescope.builtin").find_files()
      end,
      mode = "n",
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sh",
      function()
        require("telescope.builtin").help_tags()
      end,
      mode = "n",
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>sw",
      function()
        require("telescope.builtin").grep_string()
      end,
      mode = "n",
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>sg",
      function()
        require("telescope.builtin").live_grep()
      end,
      mode = "n",
      desc = "[S]earch by [G]rep",
    },
    {
      "<leader>sD",
      function()
        require("telescope.builtin").diagnostics()
      end,
      mode = "n",
      desc = "[S]earch [D]iagnostics",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
  end,
}
