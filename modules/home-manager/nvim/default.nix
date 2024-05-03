{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.local.editors.nvim;
in
{
  options.local.editors.nvim = {
    enable = lib.mkEnableOption "Neovim";
    package = lib.mkPackageOption pkgs "neovim-unwrapped" { };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      inherit (cfg) enable package;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;

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
          ;
      };
    };

    xdg.configFile."nvim" = {
      source = ./src;
      recursive = true;
    };
  };
}
