{...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      t = "tmux attach || tmux new-session -s main";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
  };
}
