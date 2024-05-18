{ pkgs, inputs, ... }:
{
  local = {
    DE.sway.enable = true;
    terminals.wezterm.enable = true;
    editors.nvim = {
      enable = true;
      package = inputs.nixpkgs-master.legacyPackages.${pkgs.system}.neovim-unwrapped;
    };
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
      wallpaper = "${../../modules/home-manager/theming/wallpapers/wp3.png}";
      colorScheme = "gruvbox-dark-hard";
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

  home.packages = builtins.attrValues {
    inherit (pkgs)
      mpv
      feh
      nitch
      wl-clipboard
      hyperfine
      ;
  };

  news.display = "silent";
  dconf.enable = true;
}
