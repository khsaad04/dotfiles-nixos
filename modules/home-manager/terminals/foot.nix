{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.terminals.foot;
  clr = config.local.theming.colorPalette;
in
{
  options.local.terminals.foot = {
    enable = lib.mkEnableOption "Foot terminal emulator";
    package = lib.mkPackageOption pkgs "foot" { };
  };

  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;
      inherit (cfg) package;
      settings = {
        main = {
          font = "${config.local.theming.font}:size=10,Symbols Nerd Font";
          pad = "10x10";
        };
        colors = {
          alpha = 0.9;
          foreground = "${clr.base05}"; # Text
          background = "${clr.base00}"; # Base
          regular0 = "${clr.base03}"; # Surface 1
          regular1 = "${clr.base08}"; # red
          regular2 = "${clr.base0B}"; # green
          regular3 = "${clr.base0A}"; # yellow
          regular4 = "${clr.base0D}"; # blue
          regular5 = "${clr.base06}"; # pink
          regular6 = "${clr.base0C}"; # teal
          regular7 = "${clr.base05}"; # Subtext 1
          bright0 = "${clr.base04}"; # Surface 2
          bright1 = "${clr.base08}"; # red
          bright2 = "${clr.base0B}"; # green
          bright3 = "${clr.base0A}"; # yellow
          bright4 = "${clr.base0D}"; # blue
          bright5 = "${clr.base0E}"; # pink
          bright6 = "${clr.base0C}"; # teal
          bright7 = "${clr.base05}"; # Subtext 0
        };
      };
    };
  };
}
