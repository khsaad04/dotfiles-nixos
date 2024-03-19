{ lib, config, ... }: {
  imports = [
    ./foot.nix
    ./wezterm.nix
  ];
  options.local.terminals = {
    default = lib.mkOption {
      type = lib.types.enum [ "wezterm" "foot" ];
      default = "wezterm";
    };
    program =
      let
        mkExec = program: program;
      in
      lib.mkOption {
        default = "${mkExec "${config.local.terminals.default}"}";
      };
  };
}
