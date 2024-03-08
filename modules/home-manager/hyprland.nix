{
  lib,
  pkgs-stable,
  config,
  ...
}:
with lib; {
  options.wm.hyprland = {
    enable = mkEnableOption "hyprland";
  };

  config = mkIf config.wm.hyprland.enable {
    home.file."./.config/fish/conf.d/hyprland.fish".text = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec ${pkgs-stable.hyprland}/bin/Hyprland
    '';
  };
}
