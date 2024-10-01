{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/Programming/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogcroots --keep-since 7d";
    };
  };
}
