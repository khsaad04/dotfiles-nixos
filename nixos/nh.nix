{
  programs.nh = {
    enable = true;
    flake = "/home/khsaad/Documents/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
