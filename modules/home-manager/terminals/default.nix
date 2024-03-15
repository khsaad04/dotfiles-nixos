{ lib, ... }: {
  imports = [
    ./foot.nix
    ./wezterm.nix
  ];
  options.terminals = with lib; {
    default = mkOption {
      type = types.enum [ "wezterm" "foot" ];
      default = "wezterm";
    };
    program = mkOption {
      type = types.path;
    };
  };
}
