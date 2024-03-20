{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.local.DE.hyprland;
in
{
  options.local.DE.hyprland = {
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
