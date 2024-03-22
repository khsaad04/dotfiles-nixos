{ lib, ... }: {
  imports = [
    ./sway.nix
    ./hyprland.nix
  ];
  options.local.DE = {
    defaultSession = lib.mkOption {
      type = lib.types.enum [ "sway" "Hyprland" ];
      default = "sway";
    };
  };
}
