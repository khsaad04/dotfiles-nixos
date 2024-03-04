{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-stable,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

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
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Timezone
  time.timeZone = "Asia/Dhaka";

  # Locale
  i18n = {
    defaultLocale = "en_US.UTF-8";
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

  # Necessary programs
  programs = {
    fish.enable = true;
    git.enable = true;
    neovim.enable = true;
    dconf.enable = true;
    sway = {
      enable = true;
      package = pkgs.swayfx;
    };
    hyprland = {
      enable = true;
      package = pkgs-stable.hyprland;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Users
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      ${username} = {
        isNormalUser = true;
        description = "KH Saad";
        extraGroups = ["networkmanager" "wheel"];
      };
    };
  };

  system.stateVersion = "24.05";
}
