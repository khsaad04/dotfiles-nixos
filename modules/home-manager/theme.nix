{ pkgs, inputs, config, lib, ... }:
let
  inherit (lib) mkOption mkEnableOption mkPackageOption types;
  cfg = config.local.theme;
in
{
  options.local.theme = {
    font = mkOption { type = types.str; default = "Iosevka"; };
    colorScheme = mkOption { type = types.str; default = "catppuccin-mocha"; };
    gtkTheme = {
      name = mkOption { type = types.str; default = "Catppuccin-Mocha-Standard-Blue-Dark"; };
      package = mkOption {
        type = types.package;
        default = pkgs.catppuccin-gtk.override {
          size = "standard";
          accents = [ "blue" ];
          variant = "mocha";
          tweaks = [ "normal" ];
        };
      };
    };
    iconTheme = {
      name = mkOption { type = types.str; default = "Papirus"; };
      package = mkPackageOption pkgs "papirus-icon-theme" { };
    };
    wallpaper = mkOption { type = types.str; };
    pointerCursor = {
      gtk = mkEnableOption "Enable for gtk apps";
      name = mkOption {
        type = types.str;
        default = "Adwaita";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.gnome.adwaita-icon-theme;
      };

      size = mkOption {
        type = types.int;
        default = 10;
      };
    };
  };

  config = {
    colorScheme = inputs.nix-colors.colorSchemes.${config.local.theme.colorScheme};

    home.pointerCursor = {
      gtk.enable = cfg.pointerCursor.gtk;
      name = cfg.pointerCursor.name;
      package = cfg.pointerCursor.package;
      size = cfg.pointerCursor.size;
    };

    gtk = {
      enable = true;
      font = {
        name = "${config.local.theme.font}";
        size = 10;
      };
      iconTheme = {
        name = cfg.iconTheme.name;
        package = cfg.iconTheme.package;
      };
      theme = {
        name = cfg.gtkTheme.name;
        package = cfg.gtkTheme.package;
      };
    };

    # Fonts
    fonts.fontconfig.enable = true;
    home.packages =
      let
        nerdfonts = pkgs.nerdfonts.override {
          fonts = [
            "NerdFontsSymbolsOnly"
          ];
        };
      in
      [
        pkgs.noto-fonts
        pkgs.noto-fonts-cjk
        pkgs.noto-fonts-emoji
        pkgs.iosevka
        nerdfonts
      ];
  };
}
