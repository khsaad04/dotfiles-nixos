{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.terminals.foot;
in {
  options.terminals.foot = {
    enable = mkEnableOption "Foot terminal emulator";
    package = mkOption {
      type = types.package;
      default = pkgs.foot;
    };
  };

  config = mkIf cfg.enable {
    programs.foot = {
      enable = cfg.enable;
      package = cfg.package;
    };
    terminals.defaultPackage = mkIf (config.terminals.defaultTerminal == "foot") "${pkgs.foot}/bin/foot";
  };
}
