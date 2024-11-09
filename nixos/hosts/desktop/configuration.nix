{
  lib,
  pkgs,
  ...
}:
{
  programs = {
    sway = {
      enable = true;
      extraPackages = lib.mkForce [ ];
    };
    command-not-found.enable = false;
    kdeconnect.enable = true;
    nix-ld.enable = true;
    nano.enable = false;
    fish.enable = true;
    git.enable = true;
    adb.enable = true;
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
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
  };

  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
