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
      inherit (cfg) enable package;
      settings = {
        main = {
          font = "${config.local.theming.font}:size=10,Symbols Nerd Font";
          pad = "10x10";
        };
        colors = {
          alpha = 0.9;
          foreground = "${builtins.replaceStrings ["#"] [""] clr.base05}"; # Text
          background = "${builtins.replaceStrings ["#"] [""] clr.base00}"; # Base
          regular0 = "${builtins.replaceStrings ["#"] [""] clr.base03}"; # Surface 1
          regular1 = "${builtins.replaceStrings ["#"] [""] clr.base08}"; # red
          regular2 = "${builtins.replaceStrings ["#"] [""] clr.base0B}"; # green
          regular3 = "${builtins.replaceStrings ["#"] [""] clr.base0A}"; # yellow
          regular4 = "${builtins.replaceStrings ["#"] [""] clr.base0D}"; # blue
          regular5 = "${builtins.replaceStrings ["#"] [""] clr.base06}"; # pink
          regular6 = "${builtins.replaceStrings ["#"] [""] clr.base0C}"; # teal
          regular7 = "${builtins.replaceStrings ["#"] [""] clr.base05}"; # Subtext 1
          bright0 = "${builtins.replaceStrings ["#"] [""] clr.base04}"; # Surface 2
          bright1 = "${builtins.replaceStrings ["#"] [""] clr.base08}"; # red
          bright2 = "${builtins.replaceStrings ["#"] [""] clr.base0B}"; # green
          bright3 = "${builtins.replaceStrings ["#"] [""] clr.base0A}"; # yellow
          bright4 = "${builtins.replaceStrings ["#"] [""] clr.base0D}"; # blue
          bright5 = "${builtins.replaceStrings ["#"] [""] clr.base0E}"; # pink
          bright6 = "${builtins.replaceStrings ["#"] [""] clr.base0C}"; # teal
          bright7 = "${builtins.replaceStrings ["#"] [""] clr.base05}"; # Subtext 0
        };
      };
    };
  };
}
