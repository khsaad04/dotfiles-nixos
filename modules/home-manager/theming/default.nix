{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkOption
    mkEnableOption
    mkPackageOption
    types
    ;
  mkColorOption =
    default:
    mkOption {
      type = types.str;
      inherit default;
    };
  cfg = config.local.theming;
in
{
  options.local.theming = {
    enable = mkEnableOption "Enable theming options";
    font = mkOption {
      type = types.str;
      default = "Iosevka";
    };
    colorPalette = {
      base00 = mkColorOption "#1e1e2e";
      base01 = mkColorOption "#181825";
      base02 = mkColorOption "#313244";
      base03 = mkColorOption "#45475a";
      base04 = mkColorOption "#585b70";
      base05 = mkColorOption "#cdd6f4";
      base06 = mkColorOption "#f5e0dc";
      base07 = mkColorOption "#b4befe";
      base08 = mkColorOption "#f38ba8";
      base09 = mkColorOption "#fab387";
      base0A = mkColorOption "#f9e2af";
      base0B = mkColorOption "#a6e3a1";
      base0C = mkColorOption "#94e2d5";
      base0D = mkColorOption "#89b4fa";
      base0E = mkColorOption "#cba6f7";
      base0F = mkColorOption "#f2cdcd";
    };
    gtk = {
      name = mkOption {
        type = types.str;
        default = "Catppuccin-Mocha-Standard-Blue-Dark";
      };
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
    icons = {
      name = mkOption {
        type = types.str;
        default = "Papirus";
      };
      package = mkPackageOption pkgs "papirus-icon-theme" { };
    };
    wallpaper = mkOption {
      type = types.str;
      default = "${./wp.png}";
    };
    cursor = {
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

  config = lib.mkIf cfg.enable {
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
