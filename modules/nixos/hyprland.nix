{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.DE.hyprland;
in {
  options.DE.hyprland = {
    enable = mkEnableOption "hyprland";
    package = mkPackageOption pkgs "hyprland" {};
  };

  config = mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        package = cfg.package;
      };
    };
  };
}
