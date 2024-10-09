{ pkgs, ... }:
{
  local = {
    DE = {
      sway.enable = true;
    };
  };

  programs = {
    nix-ld.enable = true;
    git.enable = true;
    nano.enable = false;
    fish.enable = true;
    adb.enable = true;
    command-not-found.enable = false;
    direnv = {
      enable = true;
      silent = true;
    };
    kdeconnect.enable = true;
  };

  services = {
    fstrim.enable = true;
    udisks2.enable = true;
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Dhaka";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [ pkgs.fcitx5-openbangla-keyboard ];
    };
  };

  environment.systemPackages = [
    pkgs.xdg-utils
    pkgs.vim
    pkgs.wget
    pkgs.qemu
    pkgs.file
    pkgs.fd
    pkgs.ripgrep
    (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
      qemu-system-x86_64 \
        -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
        "$@"
    '')
  ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.khsaad = {
      isNormalUser = true;
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
