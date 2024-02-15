{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
      fd
      unzip
      wl-clipboard
      gcc13
      gnumake42

      # LSPs, Formatters and Linters
      lua-language-server
      stylua
      nil
      alejandra
      ruff
      python311Packages.python-lsp-server
      rust-analyzer
    ];
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      comment-nvim
      formatter-nvim
      gitsigns-nvim
      vim-fugitive
      vim-rhubarb
      indent-blankline-nvim
      nvim-lspconfig
      neodev-nvim
      lualine-nvim
      neo-tree-nvim
      plenary-nvim
      nvim-web-devicons
      nui-nvim
      noice-nvim
      nvim-notify
      nvim-autopairs
      nvim-cmp
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      friendly-snippets
      nvim-lint
      telescope-nvim
      telescope-fzf-native-nvim
      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-rust
          p.tree-sitter-vimdoc
          p.tree-sitter-vim
          p.tree-sitter-regex
          p.tree-sitter-markdown
          p.tree-sitter-bash
          p.tree-sitter-markdown_inline
          p.tree-sitter-nix
        ]);
      }
      nvim-treesitter-textobjects
      which-key-nvim
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
