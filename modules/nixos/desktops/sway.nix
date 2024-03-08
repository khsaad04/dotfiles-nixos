{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.desktops.sway;
in {
  options.desktops.sway = {
    enable = mkEnableOption "sway";
    package = mkOption {
      type = types.package;
      default = pkgs.swayfx;
    };
  };

  config = mkIf cfg.enable {
    programs = {
      sway = {
        enable = true;
        package = cfg.package;
      };
    };
  };
}
