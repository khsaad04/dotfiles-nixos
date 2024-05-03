{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.terminals.alacritty;
  clr = config.local.theming.colorPalette;
in
{
  options.local.terminals.alacritty = {
    enable = lib.mkEnableOption "Alacritty terminal emulator";
    package = lib.mkPackageOption pkgs "alacritty" { };
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      inherit (cfg) package;
      settings = {
        window = {
          padding = {
            x = 8;
            y = 8;
          };
          opacity = 0.9;
        };
        scrolling = {
          history = 5000;
          multiplier = 3;
        };
        font = {
          normal = {
            family = "Iosevka";
            style = "Regular";
          };
          bold = {
            family = "Iosevka";
            style = "Bold";
          };
          italic = {
            family = "Iosevka";
            style = "Italic";
          };
          bold_italic = {
            family = "Iosevka";
            style = "BoldItalic";
          };
          size = 10;
        };
        colors = {
          primary = {
            background = "${clr.base00}";
            foreground = "${clr.base05}";
          };
          normal = {
            black = "${clr.base03}";
            red = "${clr.base08}";
            green = "${clr.base0B}";
            yellow = "${clr.base0A}";
            blue = "${clr.base0D}";
            magenta = "${clr.base06}";
            cyan = "${clr.base0C}";
            white = "${clr.base05}";
          };
          bright = {
            black = "${clr.base04}";
            red = "${clr.base08}";
            green = "${clr.base0B}";
            yellow = "${clr.base0A}";
            blue = "${clr.base0D}";
            magenta = "${clr.base06}";
            cyan = "${clr.base0C}";
            white = "${clr.base05}";
          };
        };
      };
    };
  };
}
