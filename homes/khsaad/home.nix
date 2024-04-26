{ pkgs, ... }:
{
  home = {
    stateVersion = "23.11";
    packages = [
      pkgs.vlc
      pkgs.feh
      pkgs.nitch
      pkgs.wl-clipboard
    ];
  };
  news.display = "silent";

  # Custom module options go here
  local = {
    DE = {
      sway.enable = true;
    };
    terminals = {
      wezterm.enable = true;
    };
    editors.nvim.enable = true;
    browsers.firefox.enable = true;
    programs = {
      tmux = {
        enable = true;
        tms.enable = true;
      };
    };
    theme = {
      wallpaper = "~/Pictures/wallpapers/lake.png";
    };
  };

  programs = {
    fish.enable = true;
    starship.enable = true;
    eza = {
      enable = true;
      extraOptions = [ "-F" ];
    };
    obs-studio.enable = true;
    lf.enable = true;
    waybar.enable = true;
    wofi.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  services.dunst.enable = true;
  dconf.enable = true;

  programs.home-manager.enable = true;
}
