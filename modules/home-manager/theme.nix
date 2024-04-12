{ pkgs, inputs, config, lib, ... }:
{
  options.local.theme = {
    font = lib.mkOption {
      type = lib.types.str;
      default = "Iosevka";
    };
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "catppuccin-mocha";
    };
    weztermTheme = lib.mkOption {
      type = lib.types.str;
      default = "Catppuccin Mocha";
    };
    wallpaper = lib.mkOption {
      type = lib.types.str;
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
        name = "${config.local.theme.font}";
        size = 10;
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

    # Fonts
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
      };
    in
    [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      iosevka
      nerdfonts
    ];
  };
}
