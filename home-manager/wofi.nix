{ ... }:
{
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
          color: #cdd6f4;
      }

      #window {
          margin: 0;
          background: rgba(30, 30, 46, 0.95);
          border-radius: 8px;
          border: 2px solid #89b4fa;
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
          background-color: #2e3440;
      }

      #text {
          margin: 2px;
      }
    '';
  };
}
