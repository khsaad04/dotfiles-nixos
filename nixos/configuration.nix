{
  pkgs,
  pkgs-stable,
  username,
  inputs,
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

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
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

  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
      };
    };
    # Sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

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
      # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
      package = pkgs-stable.hyprland;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

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

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
