{
  lib,
  pkgs,
  pkgs-stable,
  config,
  ...
}:
with lib; let
  cfg = config.desktops.hyprland;
in {
  options.desktops.hyprland = {
    enable = mkEnableOption "hyprland";
    package = mkOption {
      type = types.package;
      default = pkgs-stable.hyprland;
    };
  };

  config = mkIf cfg.enable {
    home.file."./.config/fish/conf.d/hyprland.fish".text = mkIf (config.desktops.defaultSession == "hyprland") ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec ${cfg.package}/bin/Hyprland
    '';
    home.packages = with pkgs; [swww networkmanagerapplet grimblast];
    wayland.windowManager.hyprland = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
