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
    package = mkOption {
      type = types.package;
      default = pkgs.hyprland;
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
