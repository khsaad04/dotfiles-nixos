{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.desktops.sway;
in {
  options.desktops.sway = {
    enable = mkEnableOption "sway";
    package = mkOption {
      type = types.package;
      default = pkgs.swayfx;
    };
  };

  config = mkIf cfg.enable {
    home.file."./.config/fish/conf.d/sway.fish".text = mkIf (config.desktops.defaultSession == "sway") ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec ${cfg.package}/bin/sway
    '';
    home.packages = with pkgs; [swww networkmanagerapplet grimblast];
    wayland.windowManager.sway = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
