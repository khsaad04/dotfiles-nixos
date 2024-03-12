{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.DE.sway;
in {
  options.DE.sway = {
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
