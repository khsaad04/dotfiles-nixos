{ pkgs, config, ... }:
{
  home = {
    username = "khsaad";
    homeDirectory = "/home/${config.home.username}";
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
      hyprland.enable = true;
    };
    terminals = {
      wezterm.enable = true;
      foot.enable = true;
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

      # Gruvbox

      # colorPalette = {
      #   base00 = "#1d2021"; # ----
      #   base01 = "#3c3836"; # ---
      #   base02 = "#504945"; # --
      #   base03 = "#665c54"; # -
      #   base04 = "#bdae93"; # +
      #   base05 = "#d5c4a1"; # ++
      #   base06 = "#ebdbb2"; # +++
      #   base07 = "#fbf1c7"; # ++++
      #   base08 = "#fb4934"; # red
      #   base09 = "#fe8019"; # orange
      #   base0A = "#fabd2f"; # yellow
      #   base0B = "#b8bb26"; # green
      #   base0C = "#8ec07c"; # aqua/cyan
      #   base0D = "#83a598"; # blue
      #   base0E = "#d3869b"; # purple
      #   base0F = "#d65d0e"; # brown
      # };
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
