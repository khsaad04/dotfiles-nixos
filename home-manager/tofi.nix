{ config, ... }:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.tofi = {
    settings = {
      anchor = "bottom";
      width = "100%";
      height = 22;
      horizontal = true;
      font = config.local.theming.font.name;
      font-size = config.local.theming.font.size;
      prompt-text = ''" run:"'';
      outline-width = 0;
      border-width = 0;
      background-color = matu.surface;
      text-color = matu.on_surface;
      prompt-color = matu.on_surface;
      selection-color = matu.primary;
      min-input-width = 120;
      result-spacing = 15;
      padding-top = 0;
      padding-bottom = 0;
      padding-left = 0;
      padding-right = 0;
    };
  };
}
