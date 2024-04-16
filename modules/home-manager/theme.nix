{ pkgs, inputs, config, lib, ... }:
let
  cfg = config.local.theme;
  nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
in
{
  options.local.theme = {
    font = lib.mkOption { type = lib.types.str; default = "Iosevka"; };
    colorScheme = lib.mkOption { type = lib.types.str; default = "catppuccin-mocha"; };
    iconTheme = {
      name = lib.mkOption { type = lib.types.str; default = "Papirus"; };
      package = lib.mkPackageOption pkgs "papirus-icon-theme" { };
    };
    weztermTheme = lib.mkOption { type = lib.types.str; default = "Catppuccin Mocha"; };
    wallpaper = lib.mkOption { type = lib.types.str; };
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
        name = cfg.iconTheme.name;
        package = cfg.iconTheme.package;
      };
      theme = {
        name = "${config.colorScheme.slug}";
        package = nix-colors-lib.gtkThemeFromScheme {
          scheme = config.colorScheme;
        };
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
