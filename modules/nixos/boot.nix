{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault mkBefore;
in
{
  boot = {
    kernelPackages = mkDefault pkgs.linuxPackages_zen;
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
      enable = mkDefault true;
      theme = "breeze";
    };
    loader = {
      systemd-boot = {
        configurationLimit = 10;
        enable = mkDefault true;
      };
      efi.canTouchEfiVariables = mkDefault true;
    };
  };
}
