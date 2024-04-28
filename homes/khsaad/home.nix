{ pkgs, ... }:
{
  local = {
    DE.sway.enable = true;
    terminals.wezterm.enable = true;
    editors.nvim.enable = true;
    browsers.firefox.enable = true;
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
    theme = {
      enable = true;
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

  programs = {
    home-manager.enable = true;
    eza = {
      enable = true;
      extraOptions = [ "-F" ];
    };
    obs-studio.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  services.dunst.enable = true;
  dconf.enable = true;
}
