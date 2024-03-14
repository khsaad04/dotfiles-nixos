{ lib, ... }: {
  imports = [
    ./foot.nix
    ./wezterm.nix
  ];
  options.terminals = with lib; {
    defaultTerminal = mkOption {
      type = types.enum [ "wezterm" "foot" ];
      default = "wezterm";
    };
    defaultPackage = mkOption {
      type = types.path;
    };
  };
}
