{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.wm.sway = {
    enable = mkEnableOption "sway";
  };

  config = mkIf config.wm.sway.enable {
    home.file."./.config/fish/conf.d/sway.fish".text = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec ${pkgs.swayfx}/bin/sway
    '';
  };
}
