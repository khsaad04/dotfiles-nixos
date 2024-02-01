{pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
    
    extraPackages = with pkgs; [
      tree-sitter
      cargo
      ripgrep
      fd
      unzip
      wl-clipboard
      gcc13
    ];

    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-rust
          p.tree-sitter-vimdoc
          p.tree-sitter-vim
          p.tree-sitter-regex
          p.tree-sitter-markdown
          p.tree-sitter-bash
          p.tree-sitter-nix
      ]))
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
