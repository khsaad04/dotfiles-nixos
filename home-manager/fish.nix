_: {
  programs.fish = {
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
}
