{ config, pkgs, ... }:
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

  xdg.configFile."nvim/lua/plugins/colorscheme.lua".source = "${config.programs.matugen.theme.files}/.config/nvim/lua/plugins/colorscheme.lua";
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".onChange = ''
    rm -rf ~/.cache/nvim
  '';
  xdg.configFile."nvim" = {
    source = ./src;
    recursive = true;
  };
}
