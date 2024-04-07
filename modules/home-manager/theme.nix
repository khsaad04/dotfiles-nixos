{ pkgs, inputs, config, lib, ... }:
let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};
in
{
  options.local.theme = {
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "catppuccin-mocha";
    };
    wezterm = lib.mkOption {
      type = lib.types.str;
      default = "Catppuccin Mocha";
    };
  };

  config = {
    colorScheme = inputs.nix-colors.colorSchemes.${config.local.theme.colorScheme};

    home.pointerCursor = {
      gtk.enable = true;
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 15;
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
        package = pkgs-stable.catppuccin-gtk.override {
          accents = [ "blue" ];
          tweaks = [ "black" ];
          size = "standard";
          variant = "mocha";
        };
      };
    };

    # Fonts
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [
          "FiraCode"
        ];
      };
    in
    [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
    ];
  };
}
