{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./foot.nix
    ./wezterm.nix
  ];
  options.terminals = with lib; {
    defaultTerminal = mkOption {
      type = types.path;
      default = "${pkgs.wezterm}/bin/wezterm";
    };
  };
}
