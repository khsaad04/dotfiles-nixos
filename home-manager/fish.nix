{...}: {
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
}
