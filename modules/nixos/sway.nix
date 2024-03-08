{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.wm.sway = {
    enable = mkEnableOption "sway";
  };

  config = mkIf config.wm.sway.enable {
    programs = {
      sway = {
        enable = true;
        package = pkgs.swayfx;
      };
    };
  };
}
