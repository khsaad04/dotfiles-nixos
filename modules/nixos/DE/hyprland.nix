{ lib
, pkgs
, inputs
, config
, ...
}:
let
  cfg = config.local.DE.hyprland;
in
{
  imports = [ inputs.hyprland.nixosModules.default ];
  options.local.DE.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    package = lib.mkPackageOption pkgs "hyprland" { };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
      };
    };
  };
}
