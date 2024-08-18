{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/Documents/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogcroots --nogc --keep-since 7d";
    };
  };
}
