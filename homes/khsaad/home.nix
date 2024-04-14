{ pkgs
, config
, inputs
, ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
  ];

  home = {
    username = "khsaad";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
    packages = [
      pkgs.vlc
      pkgs.nitch
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
      colorScheme = "catppuccin-mocha";
      weztermTheme = "Catppuccin Mocha";
      wallpaper = "~/Downloads/lake.png";
    };
  };

  programs = {
    fish.enable = true;
    starship.enable = true;
    eza = {
      enable = true;
      extraOptions = [
        "-F"
      ];
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
