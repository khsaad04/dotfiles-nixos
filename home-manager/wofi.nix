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
      matching = "fuzzy";
      insensitive = true;
      location = "center";
    };
    style = ''
      * {
        all: initial;
        font-family: ${config.local.theming.font.name}, Symbols Nerd Font;
        font-size: 16px;
        color: ${matu.on_background};
        border-radius: 8px;
      }

      #window {
        margin: 0;
        background: ${matu.background};
        border: 2px solid ${matu.primary};
      }

      #outer-box {
        padding: 10px;
      }

      #input {
        border: 0;
        padding: 10px;
        margin-bottom: 10px;
      }

      #input:focus {
        border: 2px solid ${matu.primary};
      }

      #entry {
        margin: 10px
      }

      #entry:selected {
        background-color: ${matu.surface_container};
      }

      #img {
        margin: 5px
      }
    '';
  };
}
