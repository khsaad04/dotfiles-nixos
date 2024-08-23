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
    withNodeJs = true;

    extraLuaPackages = luaPkgs: [ luaPkgs.jsregexp ];
    extraPackages = builtins.attrValues {
      inherit (pkgs)
        tree-sitter
        ripgrep
        fd
        unzip
        gcc
        gnumake
        lua-language-server
        nil
        stylua
        ;
    };
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
