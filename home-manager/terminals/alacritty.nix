{ config, ... }:
let
  clr = config.local.theming.colorPalette;
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.alacritty = {
    settings = {
      window = {
        padding = {
          x = 4;
          y = 4;
        };
        opacity = 0.95;
      };
      scrolling = {
        history = 10000;
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
        inherit (config.local.theming.font) size;
      };
      colors = {
        primary = {
          inherit (matu) background;
          foreground = matu.on_background;
        };
        cursor = {
          text = matu.surface_variant;
          cursor = matu.on_surface_variant;
        };
        selection = {
          text = matu.background;
          background = matu.primary;
        };
        normal = {
          black = clr.base0;
          red = clr.base1;
          green = clr.base2;
          yellow = clr.base3;
          blue = clr.base4;
          magenta = clr.base5;
          cyan = clr.base6;
          white = clr.base7;
        };
        bright = {
          black = clr.base8;
          red = clr.base9;
          green = clr.base10;
          yellow = clr.base11;
          blue = clr.base12;
          magenta = clr.base13;
          cyan = clr.base14;
          white = clr.base15;
        };
      };
    };
  };
}
