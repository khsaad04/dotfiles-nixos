{ pkgs, ... }:
{
  local = {
    bootConfig = {
      enable = true;
      plymouth = true;
    };
    greetdConfig.enable = true;
    nixConfig.enable = true;
    sound.enable = true;
    fonts.enable = true;
    DE.sway.enable = true;
  };

  services = {
    xserver.videoDrivers = ["intel"];
    fstrim.enable = true;
  };
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      file
      xdg-utils
      vim
      wget
      htop
      ;
  };

  programs = {
    git.enable = true;
    nano.enable = false;
    fish.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };
    command-not-found.enable = false;
  };

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
      ];
    };
  };

  security.polkit.enable = true;
  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
