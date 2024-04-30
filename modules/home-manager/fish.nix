{ lib, config, ... }:
let
  cfg = config.local.programs.fish;
in
{
  options.local.programs.fish.enable = lib.mkEnableOption "Enable fish configuration";
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        t = "tmux attach || tmux new-session -s main tms";
        l = "ls -la";
      };
      interactiveShellInit = ''
        set fish_greeting
        fish_vi_key_bindings
        fish_add_path -aP ~/.cargo/bin
      '';
    };
  };
}
