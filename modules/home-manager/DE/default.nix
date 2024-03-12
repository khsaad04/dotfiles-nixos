{lib, ...}: {
  imports = [
    ./sway.nix
    ./hyprland.nix
  ];
  options.DE = with lib; {
    defaultSession = mkOption {
      type = types.enum ["sway" "hyprland"];
      default = "sway";
    };
  };
}
