{
  lib,
  pkgs,
  inputs,
  config,
  ...
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
        package = inputs.hyprland.packages.${pkgs.system}.default;
        portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland.override {
          hyprland = config.programs.hyprland.finalPackage;
        };
      };
    };
  };
}
