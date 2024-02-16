{...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path -aP ~/.cargo/bin
      starship init fish | source
    '';
  };
}
