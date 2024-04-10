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
          font = wezterm.font({
            family = "${config.local.theme.font}",
            harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
          }),
          font_size = 10,
          color_scheme = "${config.local.theme.weztermTheme}",

          hide_tab_bar_if_only_one_tab = true,
          window_close_confirmation = "NeverPrompt",

          inactive_pane_hsb = {
            saturation = 0.9,
            brightness = 0.8,
          },

          window_background_opacity = 0.97,
          text_background_opacity = 1.0,
        }
      '';
    };
  };
}
