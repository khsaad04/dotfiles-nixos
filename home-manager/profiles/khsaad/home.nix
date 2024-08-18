{ pkgs, inputs, ... }:
{
  local = {
    theming = {
      enable = true;
      wallpaper = "${../../theming/wallpapers/wp.png}";
    };
  };

  programs = {
    home-manager.enable = true;
    eza = {
      enable = true;
      extraOptions = [
        "-s"
        "Ext"
        "-F"
      ];
    };
    obs-studio.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  home.packages = [
    pkgs.mpv
    pkgs.feh
    pkgs.nitch
    pkgs.wl-clipboard
    pkgs.hyperfine
    pkgs.android-tools
    pkgs.jdk
    pkgs.qbittorrent
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.self.packages.${pkgs.system}.formatter
  ];

  news.display = "silent";
  dconf.enable = true;
}
