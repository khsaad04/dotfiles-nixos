{...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        font = wezterm.font("FiraCode Nerd Font"),
        font_size = 11.0,
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
}
