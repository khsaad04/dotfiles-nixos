{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.walker;
in
{
  options.programs.walker.enable = lib.mkEnableOption "Enable walker launcher";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.walker ];
    xdg.configFile = {
      "walker/themes/catppuccin.css".source = ./style.css;
    };
  };
}
