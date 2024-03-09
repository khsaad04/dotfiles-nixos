{
  inputs,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.disko.nixosModules.disko
    ./disko.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Networking
  networking = {
    hostName = "${hostname}";
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
}
