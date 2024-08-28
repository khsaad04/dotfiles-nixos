{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs.neovim = {
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaPackages = luaPkgs: [ luaPkgs.jsregexp ];
    extraPackages = [
      pkgs.stdenv.cc.cc
      pkgs.cmake
      pkgs.unzip
      pkgs.tree-sitter
      pkgs.ripgrep
      pkgs.fd

      pkgs.lua-language-server
      pkgs.nil
      pkgs.stylua
      pkgs.prettierd
    ];
  };

  xdg.configFile = lib.mkIf config.programs.neovim.enable {
    "nvim" = {
      source = ./src;
      recursive = true;
    };
    "nvim/lua/plugins/colorscheme.lua" = {
      source = "${config.programs.matugen.theme.files}/.config/nvim/lua/plugins/colorscheme.lua";
      onChange = ''
        rm -rf ~/.cache/nvim
      '';
    };
  };
}
