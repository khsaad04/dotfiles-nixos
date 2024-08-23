{ pkgs, ... }:
{
  local = {
    DE.hyprland.enable = true;
  };

  programs = {
    git.enable = true;
    nano.enable = false;
    fish.enable = true;
    nix-ld.enable = true;
    adb.enable = true;
    command-not-found.enable = false;
    direnv = {
      enable = true;
      silent = true;
    };
  };

  services.fstrim.enable = true;
  security.polkit.enable = true;
  hardware.graphics.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = [
    pkgs.file
    pkgs.xdg-utils
    pkgs.vim
    pkgs.wget
    pkgs.htop
    pkgs.qemu
  ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.khsaad = {
      isNormalUser = true;
      useDefaultShell = true;
      initialPassword = "khsaad";
      description = "KH Saad";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
      ];
    };
  };

  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
