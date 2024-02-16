{config, ...}: let
  clr = config.colorScheme.palette;
in {
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      prompt = " Search...";
      width = 450;
      height = 300;
      allow_images = true;
      image_size = 38;
      term = "foot";
      matching = "fuzzy";
      insensitive = true;
      location = "center";
    };
    style = ''
      * {
          all: initial;
          font-family: FiraCode Nerd Font;
          font-size: 16px;
          font-weight: 500;
          color: #${clr.base05};
      }

      #window {
          margin: 0;
          background: #${clr.base00};
          border-radius: 8px;
          border: 2px solid #${clr.base0D};
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
          background-color: #${clr.base02};
      }

      #text {
          margin: 2px;
      }
    '';
  };
}
