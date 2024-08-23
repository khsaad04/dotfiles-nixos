{
  lib,
  inputs,
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
      package = lib.mkPackageOption inputs.hyprland.packages.${pkgs.system} "hyprland" { };
    };
    sway = {
      enable = lib.mkEnableOption "sway";
      package = lib.mkPackageOption pkgs "swayfx" { };
    };
  };
  imports = [ inputs.hyprland.nixosModules.default ];
  config = {
    programs = {
      hyprland = {
        inherit (config.local.DE.hyprland) enable;
      };
      sway = {
        inherit (config.local.DE.sway) enable package;
        extraPackages = [ ];
      };
    };
  };
}
