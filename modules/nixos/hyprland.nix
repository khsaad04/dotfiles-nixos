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
    programs = {
      hyprland = {
        enable = true;
        package = pkgs-stable.hyprland;
      };
    };
  };
}
