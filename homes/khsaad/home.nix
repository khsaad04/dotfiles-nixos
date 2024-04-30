{ pkgs, ... }:
{
  local = {
    DE.sway.enable = true;
    terminals.wezterm.enable = true;
    editors.nvim.enable = true;
    browsers.firefox.enable = true;
    services.dunst.enable = true;
    programs = {
      lf.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      tmux = {
        enable = true;
        tms = true;
      };
    };
    theme = {
      wallpaper = "~/Pictures/wallpapers/lake.png";
    };
  };

  home = {
    packages = builtins.attrValues {
      inherit (pkgs)
        vlc
        feh
        nitch
        wl-clipboard
        ;
    };
  };
  news.display = "silent";
  dconf.enable = true;
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
}
