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
    DE = {
      sway.enable = true;
      hyprland = {
        enable = false;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      };
    };
  };

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  programs = {
    fish.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };
  };

  services.pipewire.enable = true;

  system.stateVersion = "24.05";
}
