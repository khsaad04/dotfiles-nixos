{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
{
  options.local.DE = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland window manager";
    sway = {
      enable = lib.mkEnableOption "Enable sway window manager";
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
        extraPackages = lib.mkForce [ ];
      };
    };
  };
}
