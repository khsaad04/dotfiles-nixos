{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.DE.hyprland;
in
{
  options.DE.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    package = lib.mkPackageOption pkgs "hyprland" { };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        package = cfg.package;
      };
    };
  };
}
