{ pkgs, inputs, ... }:
{
  local = {
    DE.sway.enable = true;
    DE.hyprland.enable = true;
    terminals.wezterm.enable = true;
    editors.nvim.enable = true;
    browsers.firefox.enable = true;
    services.dunst.enable = true;
    programs = {
      fish.enable = true;
      starship.enable = true;
      lf.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      tmux = {
        enable = true;
        tms = true;
      };
    };
    theming = {
      enable = true;
      wallpaper = "${../../modules/home-manager/theming/wallpapers/wp.png}";
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
    inputs.pollymc.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  news.display = "silent";
  dconf.enable = true;
}
