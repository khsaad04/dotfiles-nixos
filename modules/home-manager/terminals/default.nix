{ lib, ... }: {
  imports = [
    ./foot.nix
    ./wezterm.nix
  ];
  options.terminals = {
    default = lib.mkOption {
      type = lib.types.enum [ "wezterm" "foot" ];
      default = "wezterm";
    };
    program = lib.mkOption {
      type = lib.types.path;
    };
  };
}
