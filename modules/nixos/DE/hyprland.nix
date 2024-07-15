{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.DE.hyprland;
in
{
  options.local.DE.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    # package = lib.mkPackageOption inputs.hyprland.packages.${pkgs.system} "hyprland" { };
    package = lib.mkPackageOption pkgs "hyprland" { };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        inherit (cfg) enable package;
        # portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland.override {
        #   hyprland = config.programs.hyprland.finalPackage;
        # };
      };
    };
  };
}
