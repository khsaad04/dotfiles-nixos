{ lib
, pkgs
, ...
}: {
  nix = {
    settings = {
      warn-dirty = lib.mkDefault false;
      auto-optimise-store = lib.mkDefault true;
      experimental-features = lib.mkDefault [ "nix-command" "flakes" ];
      trusted-users = lib.mkDefault [ "khsaad" ];
      extra-substituters = lib.mkDefault [ "https://nix-community.cachix.org" ];
      extra-trusted-public-keys = lib.mkDefault [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = lib.mkDefault true;
    };
  };

  security = {
    polkit.enable = lib.mkDefault true;
    rtkit.enable = lib.mkDefault true;
  };

  services = {
    pipewire = {
      alsa.enable = lib.mkDefault true;
      alsa.support32Bit = lib.mkDefault true;
      pulse.enable = lib.mkDefault true;
      jack.enable = lib.mkDefault true;
      wireplumber.enable = lib.mkDefault true;
    };
  };
}
