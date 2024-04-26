{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.DE.sway;
in
{
  options.local.DE.sway = {
    enable = lib.mkEnableOption "sway";
    package = lib.mkPackageOption pkgs "swayfx" { };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      sway = {
        inherit (cfg) enable package;
        extraPackages = [];
      };
    };
  };
}
