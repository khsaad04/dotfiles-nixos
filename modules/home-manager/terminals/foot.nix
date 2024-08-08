{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.terminals.foot;
  clr = config.local.theming.colorPalette;
  matu = config.programs.matugen.theme.colors.colors.dark;
  strip = s: builtins.substring 1 6 s;
in
{
  options.local.terminals.foot = {
    enable = lib.mkEnableOption "Foot terminal emulator";
    package = lib.mkPackageOption pkgs "foot" { };
  };

  config = lib.mkIf cfg.enable {
    programs.foot = {
      inherit (cfg) enable package;
      settings = {
        main = {
          font = "${config.local.theming.font}:size=10,Symbols Nerd Font";
          pad = "10x10";
        };
        colors = {
          alpha = 0.9;
          background = strip matu.surface;
          foreground = strip matu.on_surface;
          regular0 = "${strip clr.base0}"; # Surface 1
          regular1 = "${strip clr.base1}"; # red
          regular2 = "${strip clr.base2}"; # green
          regular3 = "${strip clr.base3}"; # yellow
          regular4 = "${strip clr.base4}"; # blue
          regular5 = "${strip clr.base5}"; # pink
          regular6 = "${strip clr.base6}"; # teal
          regular7 = "${strip clr.base7}"; # Subtext 1
          bright0 = "${strip clr.base8}"; # Surface 2
          bright1 = "${strip clr.base9}"; # red
          bright2 = "${strip clr.base10}"; # green
          bright3 = "${strip clr.base11}"; # yellow
          bright4 = "${strip clr.base12}"; # blue
          bright5 = "${strip clr.base13}"; # pink
          bright6 = "${strip clr.base14}"; # teal
          bright7 = "${strip clr.base15}"; # Subtext 0
        };
      };
    };
  };
}
