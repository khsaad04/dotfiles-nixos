{ lib
, pkgs
, ...
}:
{
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    kernelParams = lib.mkBefore [
      "logo.nologo"
      "fbcon=nodefer"
      "bgrt_disable"
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
      enable = lib.mkDefault true;
      theme = "breeze";
    };
    loader = {
      systemd-boot = {
        configurationLimit = 10;
        enable = lib.mkDefault true;
      };
      efi.canTouchEfiVariables = lib.mkDefault true;
    };
  };
}
