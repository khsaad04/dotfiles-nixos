{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.terminals.wezterm;
in {
  options.terminals.wezterm = {
    enable = mkEnableOption "WezTerm terminal emulator";
    package = mkOption {
      type = types.package;
      default = pkgs.wezterm;
    };
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
