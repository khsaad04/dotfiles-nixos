{ config, ... }:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.wofi = {
    settings = {
      show = "drun";
      prompt = " Search...";
      width = 450;
      height = 300;
      allow_images = true;
      image_size = 38;
      term = "kitty";
      matching = "fuzzy";
      insensitive = true;
      location = "center";
    };
    style = ''
      * {
          all: initial;
          font-family: Symbols Nerd Font Mono, ${config.local.theming.font.name};
          font-size: 16px;
          font-weight: 500;
          color: ${matu.on_background};
      }

      #window {
          margin: 0;
          background: ${matu.background};
          border-radius: 8px;
          border: 2px solid ${matu.primary};
      }

      #input {
          border: 0;
          padding: 10px;
          margin-bottom: 10px;
          border-radius: 8px;
      }

      #input:focus {
          border: 0;
      }

      #outer-box {
          padding: 10px;
      }

      #img {
          margin-right: 6px;
      }

      #entry {
          padding: 10px;
          border-radius: 8px;
      }

      #entry:selected {
          background-color: ${matu.surface_container};
      }

      #text {
          margin: 2px;
      }
    '';
  };
}
