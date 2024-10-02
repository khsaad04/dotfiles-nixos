{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
{
  options.local.DE = {
    xfce.enable = lib.mkEnableOption "Enable xfce desktop environment";
    hyprland.enable = lib.mkEnableOption "Enable hyprland window manager";
    sway = {
      enable = lib.mkEnableOption "Enable sway window manager";
      package = lib.mkPackageOption pkgs "swayfx" { };
    };
  };
  imports = [ inputs.hyprland.nixosModules.default ];
  config = {
    services = lib.mkIf config.local.DE.xfce.enable {
      xserver = {
        enable = true;
        desktopManager.xfce.enable = true;
        displayManager.startx.enable = true;
      };
    };
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
