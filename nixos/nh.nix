{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/Documents/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogcroots --keep-since 7d";
    };
  };
}
