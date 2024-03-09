{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.shell.fish;
in {
  options.shell.fish = {
    enable = mkEnableOption "Fish Shell";
  };
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        t = "tmux attach || tmux new-session -s main";
      };
      interactiveShellInit = ''
        set fish_greeting
        fish_add_path -aP ~/.cargo/bin
        starship init fish | source
      '';
    };
  };
}
