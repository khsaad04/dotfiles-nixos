{
  pkgs,
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # Custom module options go here
  DE = {
    sway.enable = true;
    hyprland = {
      enable = false;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  browsers.firefox.enable = true;

  shell = {
    fish.enable = true;
    starship.enable = true;
  };

  terminals = {
    defaultTerminal = "wezterm";
    wezterm.enable = true;
    foot.enable = true;
  };

  editors.nvim.enable = true;

  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; let
    nerdfonts = pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    };
  in [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
  ];

  programs = {
    obs-studio.enable = true;
    lf.enable = true;
    neofetch.enable = true;
    tmux = {
      enable = true;
      tms.enable = true;
    };
    waybar.enable = true;
    wofi.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  services.dunst.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
