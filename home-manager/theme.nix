{pkgs, ...}: let
  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "FiraCode"
    ];
  };
in {
  home.packages = [nerdfonts];

  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 22;
  };

  gtk = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        tweaks = ["black"];
        size = "standard";
        variant = "mocha";
      };
    };
  };
}
