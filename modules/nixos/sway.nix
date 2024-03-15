{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.DE.sway;
in
{
  options.DE.sway = {
    enable = lib.mkEnableOption "sway";
    package = lib.mkPackageOption pkgs "swayfx" { };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      sway = {
        enable = true;
        package = cfg.package;
      };
    };
  };
}
