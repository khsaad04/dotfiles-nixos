{ config, ... }:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.wofi = {
    settings = {
      prompt = "Search...";
      width = 400;
      height = 300;
      allow_markup = true;
      insensitive = true;
      location = "center";
    };
    style = ''
      * {
        all: initial;
        font-family: ${config.local.theming.font.name}, Symbols Nerd Font;
        font-size: 16px;
        color: ${matu.on_surface};
        border-radius: 8px;
        margin: 2px;
        padding: 2px;
        border: 0px;
      }

      #window {
        margin: 0;
        background: ${matu.surface};
        border: 2px solid ${matu.primary};
      }

      #input {
        margin: 10px;
        padding: 10px;
        background: ${matu.surface_container};
      }

      #entry:selected {
        background-color: ${matu.surface_container};
        color: ${matu.primary};
      }
    '';
  };
}
