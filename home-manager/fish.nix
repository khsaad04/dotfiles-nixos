{config, ...}: {
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
  home.file."./.config/fish/conf.d/sway.fish".text = ''
    set TTY1 (tty)
    [ "$TTY1" = "/dev/tty1" ] && exec sway
  '';
}
