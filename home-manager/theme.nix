{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override {
    fonts = [
      "FiraCode"
    ];
  });
in
{
  home.packages = with pkgs; [ nerdfonts ];

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
        size = "standard";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
  };
}
