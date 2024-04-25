{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.terminals.wezterm;
  clr = config.local.theme.colorPalette;
in
{
  options.local.terminals.wezterm = {
    enable = lib.mkEnableOption "WezTerm terminal emulator";
    package = lib.mkPackageOption pkgs "wezterm" { };
  };

  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      inherit (cfg) enable;
      inherit (cfg) package;
      extraConfig = ''
        return {
          font = wezterm.font_with_fallback({
            {
              family = "${config.local.theme.font}",
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
            background = '${clr.base00}',
            foreground = '${clr.base05}',

            cursor_fg = '${clr.base00}',
            cursor_bg = '${clr.base06}',
            cursor_border = '${clr.base06}',

            selection_fg = '${clr.base05}',
            selection_bg = '${clr.base04}',

            ansi = {
              '${clr.base03}',
              '${clr.base08}',
              '${clr.base0B}',
              '${clr.base0A}',
              '${clr.base0D}',
              '${clr.base06}',
              '${clr.base0C}',
              '${clr.base05}',
            },
            brights = {
              '${clr.base04}',
              '${clr.base08}',
              '${clr.base0B}',
              '${clr.base0A}',
              '${clr.base0D}',
              '${clr.base0E}',
              '${clr.base0C}',
              '${clr.base05}',
            },
          },
        }
      '';
    };
  };
}
