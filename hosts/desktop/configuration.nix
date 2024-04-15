{ inputs
, pkgs
, ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ./hardware-configuration.nix
  ];

  # Custom module options
  local = {
    sound.enable = true;
    DE = {
      sway.enable = true;
      hyprland.enable = true;
    };
  };

  services.greetd.enable = true;

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = [
    pkgs.file
    pkgs.xdg-utils
    pkgs.vim
    pkgs.wget
  ];

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

  security.polkit.enable = true;
  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
