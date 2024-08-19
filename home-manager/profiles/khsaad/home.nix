{
  pkgs,
  inputs,
  config,
  ...
}:
{
  local = {
    theming = {
      enable = true;
      wallpaper = "${config.local.theming.wallpath}/wp.png";
    };
  };

  programs = {
    zathura.enable = true;
    home-manager.enable = true;
    obs-studio.enable = true;
    mpv.enable = true;
    feh.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  home.packages = [
    pkgs.nitch
    pkgs.wl-clipboard
    pkgs.hyperfine
    pkgs.qbittorrent
    pkgs.pavucontrol
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.self.packages.${pkgs.system}.formatter
  ];

  news.display = "silent";
  dconf.enable = true;
}
