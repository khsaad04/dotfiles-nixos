{ pkgs, config, ... }:
let
  cfg = config.local.theming;
in
{
  home.pointerCursor = {
    inherit (cfg.cursor) name package size;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "${config.local.theming.font.name}";
      inherit (config.local.theming.font) size;
    };
    iconTheme = {
      inherit (cfg.icon) name package;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
  xdg.configFile."gtk-3.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-3.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";
}