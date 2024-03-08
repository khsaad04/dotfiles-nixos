{
  inputs,
  lib,
  config,
  pkgs,
  hostname,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["khsaad"];
      extra-substituters = ["https://nix-community.cachix.org"];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
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
      ${username} = {
        isNormalUser = true;
        initialPassword = "khsaad";
        description = "KH Saad";
        extraGroups = ["networkmanager" "wheel"];
      };
    };
  };

  # Sound
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  security = {
    rtkit.enable = true;
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

  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix = {
    nixPath = ["/etc/nix/path"];
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };

  system.stateVersion = "24.05";
}
