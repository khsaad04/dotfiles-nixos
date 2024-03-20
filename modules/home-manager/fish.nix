{
  programs.fish = {
    shellAliases = {
      t = "tmux attach || tmux new-session -s main tms";
    };
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path -aP ~/.cargo/bin
      starship init fish | source
    '';
  };
}
