{
  lib,
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
    programs = {
      hyprland = {
        enable = true;
        package = cfg.package;
      };
    };
  };
}
