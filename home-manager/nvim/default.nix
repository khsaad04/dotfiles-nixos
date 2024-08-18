{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;

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
        wl-clipboard
        gcc
        gnumake
        lua-language-server
        nil
        stylua
        ;
    };
  };

  xdg.configFile = lib.mkIf config.programs.neovim.enable {
    "nvim/lua/plugins/colorscheme.lua".source = "${config.programs.matugen.theme.files}/.config/nvim/lua/plugins/colorscheme.lua";
    "nvim/lua/plugins/colorscheme.lua".onChange = ''
      rm -rf ~/.cache/nvim
    '';
    "nvim" = {
      source = ./src;
      recursive = true;
    };
  };
}
