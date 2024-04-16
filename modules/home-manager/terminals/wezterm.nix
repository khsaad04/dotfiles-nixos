{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.local.terminals.wezterm;
in
{
  options.local.terminals.wezterm = {
    enable = lib.mkEnableOption "WezTerm terminal emulator";
    package = lib.mkPackageOption pkgs "wezterm" { };
  };

  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      enable = cfg.enable;
      package = cfg.package;
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
          color_scheme = "${config.local.theme.weztermTheme}",

          hide_tab_bar_if_only_one_tab = true,
          window_close_confirmation = "NeverPrompt",
          window_background_opacity = 0.9,
          text_background_opacity = 1.0,
        }
      '';
    };
  };
}
