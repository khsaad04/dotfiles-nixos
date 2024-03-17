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
            family = "FiraCode Nerd Font",
            harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
          }),
          font_size = 10,
          font_rules = {
            {
              intensity = "Bold",
              font = wezterm.font {
                family = "FiraCode Nerd Font",
                weight = "Bold",
              },
            },
          },
          color_scheme = "Catppuccin Mocha",

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
    local.terminals.program = lib.mkIf (config.local.terminals.default == "wezterm") "${pkgs.wezterm}/bin/wezterm";
  };
}
