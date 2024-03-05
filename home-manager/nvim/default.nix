{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;

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
      python311Packages.black
      python311Packages.isort
      zls
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./.;
    recursive = true;
  };
}
