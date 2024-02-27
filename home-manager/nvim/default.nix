{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

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
      nixd
      alejandra
      ruff
      python311Packages.python-lsp-server
      python311Packages.black
      python311Packages.isort
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
