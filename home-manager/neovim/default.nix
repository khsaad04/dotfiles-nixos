{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
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
