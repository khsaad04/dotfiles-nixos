{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.local.DE = {
    defaultSession = lib.mkOption {
      type = lib.types.enum [
        "sway"
        "Hyprland"
      ];
      default = "sway";
    };
    hyprland = {
      enable = lib.mkEnableOption "hyprland";
      # package = lib.mkPackageOption inputs.hyprland.packages.${pkgs.system} "hyprland" { };
      package = lib.mkPackageOption pkgs "hyprland" { };
    };
    sway = {
      enable = lib.mkEnableOption "sway";
      package = lib.mkPackageOption pkgs "swayfx" { };
    };
  };
  config = {
    programs = {
      hyprland = lib.mkIf config.local.DE.hyprland.enable {
        inherit (config.local.DE.hyprland) enable package;
        # portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland.override {
        #   hyprland = config.programs.hyprland.finalPackage;
        # };
      };
      sway = {
        inherit (config.local.DE.sway) enable package;
        extraPackages = [ ];
      };
    };
  };
}
