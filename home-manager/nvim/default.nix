{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

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
      # LSP, Formatter and Linter
      nvim-lspconfig
      formatter-nvim
      nvim-lint

      # CMP
      nvim-cmp
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      friendly-snippets

      # Git related
      gitsigns-nvim
      vim-fugitive

      # Noice
      noice-nvim
      nvim-notify
      nui-nvim

      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      # Treesitter
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

      # Misc
      lualine-nvim
      neo-tree-nvim
      which-key-nvim
      nvim-web-devicons
      nvim-autopairs
      catppuccin-nvim
      comment-nvim
      vim-sleuth
      indent-blankline-nvim
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
