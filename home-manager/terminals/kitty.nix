{ config, ... }:
let
  clr = config.local.theming.colorPalette;
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.kitty = {
    font = {
      name = "${config.local.theming.font.name}";
      inherit (config.local.theming.font) size;
    };
    shellIntegration = {
      enableFishIntegration = false;
      enableBashIntegration = false;
      enableZshIntegration = false;
    };

    settings = {
      window_margin_width = 4;
      placement_strategy = "center";
      confirm_os_window_close = 0;

      background_opacity = "0.95";
      background = matu.surface;
      foreground = matu.on_surface;

      cursor = matu.on_surface_variant;
      cursor_shape = "block";
      cursor_text_color = matu.surface_variant;

      selection_background = matu.primary;
      selection_foreground = matu.surface;

      color0 = "${clr.base0}";
      color1 = "${clr.base1}";
      color2 = "${clr.base2}";
      color3 = "${clr.base3}";
      color4 = "${clr.base4}";
      color5 = "${clr.base5}";
      color6 = "${clr.base6}";
      color7 = "${clr.base7}";
      color8 = "${clr.base8}";
      color9 = "${clr.base9}";
      color10 = "${clr.base10}";
      color11 = "${clr.base11}";
      color12 = "${clr.base12}";
      color13 = "${clr.base13}";
      color14 = "${clr.base14}";
      color15 = "${clr.base15}";
    };
  };
}
