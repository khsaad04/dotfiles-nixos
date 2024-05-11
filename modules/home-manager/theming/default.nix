{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (lib.types)
    int
    str
    package
    attrsOf
    ;
  inherit (lib)
    mkIf
    mkOption
    mkEnableOption
    mkPackageOption
    ;
  cfg = config.local.theming;
  getColorPalette = palette: (import ./palettes/${palette}.nix).palette;
in
{
  options.local.theming = {
    enable = mkEnableOption "Enable theming options";
    font = mkOption {
      type = str;
      default = "Iosevka";
    };
    colorScheme = mkOption {
      type = str;
      default = "catppuccin-mocha";
    };
    colorPalette = mkOption {
      type = attrsOf str;
      default = getColorPalette config.local.theming.colorScheme;
    };
    gtk = {
      name = mkOption {
        type = str;
        default = "Catppuccin-Mocha-Standard-Blue-Dark";
      };
      package = mkOption {
        type = package;
        default = pkgs.catppuccin-gtk.override {
          size = "standard";
          accents = [ "blue" ];
          variant = "mocha";
          tweaks = [ "normal" ];
        };
      };
    };
    icons = {
      name = mkOption {
        type = str;
        default = "Papirus";
      };
      package = mkPackageOption pkgs "papirus-icon-theme" { };
    };
    wallpaper = mkOption {
      type = str;
      default = "${./wallpapers/wp2.png}";
    };
    cursor = {
      gtk = mkEnableOption "Enable for gtk apps";
      name = mkOption {
        type = str;
        default = "Adwaita";
      };

      package = mkOption {
        type = package;
        default = pkgs.gnome.adwaita-icon-theme;
      };

      size = mkOption {
        type = int;
        default = 10;
      };
    };
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = cfg.cursor.gtk;
      inherit (cfg.cursor) name package size;
    };

    gtk = {
      enable = true;
      font = {
        name = "${config.local.theming.font}";
        size = 10;
      };
      iconTheme = {
        inherit (cfg.icons) name package;
      };
      theme = {
        inherit (cfg.gtk) name package;
      };
    };
  };
}
