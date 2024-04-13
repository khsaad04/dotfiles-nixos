{ pkgs, inputs, config, lib, ... }:
let
  nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
in
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
        name = "${config.colorScheme.slug}";
        package = nix-colors-lib.gtkThemeFromScheme {
          scheme = config.colorScheme;
        };
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
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
      iosevka
      nerdfonts
    ];
  };
}
