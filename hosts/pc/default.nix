{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ../../users/khsaad/configuration.nix
  ];

  # Networking
  networking = {
    hostName = "pc";
    networkmanager.enable = true;
  };

  # Timezone
  time.timeZone = "Asia/Dhaka";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      khsaad = {
        isNormalUser = true;
        initialPassword = "khsaad";
        description = "KH Saad";
        extraGroups = ["networkmanager" "wheel"];
      };
    };
  };

  security = {
    polkit.enable = true;
  };

  # Necessary programs
  programs = {
    fish.enable = true;
    git.enable = true;
    neovim.enable = true;
    dconf.enable = true;
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };

  # Custom module options
  desktops.sway.enable = true;
  desktops.hyprland.enable = true;

  boot.initrd.availableKernelModules = ["xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/home/khsaad/ext" = {
    device = "/dev/disk/by-label/EXT";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
