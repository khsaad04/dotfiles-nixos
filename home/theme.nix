{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override {
    fonts = [
      "FiraCode"
    ];
  });
in
{
  home.packages = [ nerdfonts ];

  gtk = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        tweaks = [ "black" ];
        size = "standard";
        variant = "mocha";
      };
    };
  };
}
