{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      # LSPs, Formatters and Linters
      lua-language-server
      stylua
      nil
      alejandra
      ruff
      python311Packages.python-lsp-server
      rust-analyzer

      # Deps
      tree-sitter
      ripgrep
      fd
      unzip
      wl-clipboard
      gcc13
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
