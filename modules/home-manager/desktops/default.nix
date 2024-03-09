{lib, ...}: {
  imports = [
    ./sway.nix
    ./hyprland.nix
  ];
  options.desktops = with lib; {
    defaultSession = mkOption {
      type = types.enum ["sway" "hyprland"];
      default = "sway";
    };
  };
}
