{...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path -aP ~/.cargo/bin
      fish_add_path -aP ~/.config/hypr/scripts
      starship init fish | source
    '';
  };
}
