{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkBefore mkEnableOption mkIf;
  cfg = config.local.bootConfig;
in
{
  options.local.bootConfig = {
    enable = mkEnableOption "Enable boot configurations";
    plymouth = mkEnableOption "Enable plymouth";
  };
  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = mkBefore [
        "vt.global_cursor_default=0"
        "quiet"
        "systemd.show_status=false"
        "rd.udev.log_level=3"
        "splash"
      ];
      consoleLogLevel = 3;
      initrd = {
        verbose = false;
        systemd.enable = true;
      };
      plymouth = {
        enable = cfg.plymouth;
        theme = "breeze";
      };
      loader = {
        systemd-boot = {
          configurationLimit = 10;
          consoleMode = "max";
          editor = false;
          enable = true;
        };
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
