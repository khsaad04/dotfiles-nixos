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
    theming = {
      enable = true;
      wallpaper = "~/Pictures/wallpapers/lake.png";
    };
    DE.sway.enable = true;
  };

  services.fstrim.enable = true;
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
