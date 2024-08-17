{ pkgs, ... }:
{
  local = {
    DE.sway.enable = true;
    DE.hyprland.enable = true;
  };

  programs = {
    git.enable = true;
    nano.enable = false;
    fish.enable = true;
    nix-ld.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };
    command-not-found.enable = false;
  };

  services = {
    xserver.videoDrivers = [ "intel" ];
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

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "@wheel" ];

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

  hardware.graphics.enable = true;

  system.stateVersion = "24.05";
}
