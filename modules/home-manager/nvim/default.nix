{ lib, config, pkgs, ... }:
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
      enable = true;
      package = cfg.package;

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
      ];
    };

    xdg.configFile."nvim" = {
      source = ./src;
      recursive = true;
    };
  };
}
