{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/ext/code/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--nogcroots --keep-since 7d";
    };
  };
}
