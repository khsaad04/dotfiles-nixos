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
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # Custom module options go here
  local = {
    DE = {
      defaultSession = "sway";
      sway.enable = true;
      hyprland = {
        enable = false;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      };
    };

    browsers.firefox.enable = true;

    terminals = {
      default = "wezterm";
      wezterm.enable = true;
      foot.enable = true;
    };

    editors.nvim.enable = true;

    programs = {
      neofetch.enable = true;
      tmux = {
        enable = true;
        tms.enable = true;
      };
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
