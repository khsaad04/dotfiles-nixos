{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.terminals.wezterm;
  clr = config.local.theming.colorPalette;
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  options.local.terminals.wezterm = {
    enable = lib.mkEnableOption "WezTerm terminal emulator";
    package = lib.mkPackageOption pkgs "wezterm" { };
  };

  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      inherit (cfg) enable package;
      extraConfig = ''
        return {
          font = wezterm.font_with_fallback({
            {
              family = "${config.local.theming.font}",
              harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
            },
            "Symbols Nerd Font",
          }),
          font_size = 10,
          hide_tab_bar_if_only_one_tab = true,
          window_close_confirmation = "NeverPrompt",
          window_background_opacity = 0.9,
          text_background_opacity = 1.0,
          colors = {
            background = '${matu.background}',
            foreground = '${matu.on_background}',

            cursor_fg = '${matu.surface_variant}',
            cursor_bg = '${matu.on_surface_variant}',
            cursor_border = '${matu.on_surface_variant}',

            selection_fg = '${matu.on_secondary}',
            selection_bg = '${matu.secondary_fixed_dim}',

            ansi = {
              '${clr.base0}',
              '${clr.base1}',
              '${clr.base2}',
              '${clr.base3}',
              '${clr.base4}',
              '${clr.base5}',
              '${clr.base6}',
              '${clr.base7}',
            },
            brights = {
              '${clr.base8}',
              '${clr.base9}',
              '${clr.base10}',
              '${clr.base11}',
              '${clr.base12}',
              '${clr.base13}',
              '${clr.base14}',
              '${clr.base15}',
            },
          },
        }
      '';
    };
  };
}
