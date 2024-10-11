{ config, ... }:
let
  clr = config.local.theming.colorPalette;
  matu = config.programs.matugen.theme.colors.colors.dark;
  strip = s: builtins.substring 1 6 s;
in
{
  programs.foot = {
    settings = {
      main = {
        font = "${config.local.theming.font.name}:size=${toString config.local.theming.font.size},Symbols Nerd Font";
        pad = "4x4 center";
      };
      colors = {
        alpha = 1;
        background = strip matu.surface;
        foreground = strip matu.on_surface;
        regular0 = "${strip clr.base0}";
        regular1 = "${strip clr.base1}";
        regular2 = "${strip clr.base2}";
        regular3 = "${strip clr.base3}";
        regular4 = "${strip clr.base4}";
        regular5 = "${strip clr.base5}";
        regular6 = "${strip clr.base6}";
        regular7 = "${strip clr.base7}";
        bright0 = "${strip clr.base8}";
        bright1 = "${strip clr.base9}";
        bright2 = "${strip clr.base10}";
        bright3 = "${strip clr.base11}";
        bright4 = "${strip clr.base12}";
        bright5 = "${strip clr.base13}";
        bright6 = "${strip clr.base14}";
        bright7 = "${strip clr.base15}";
      };
    };
  };
}
