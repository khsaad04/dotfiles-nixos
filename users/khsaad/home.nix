{
  pkgs,
  username,
  inputs,
  ...
}: {
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # Custom module options go here
  desktops.sway.enable = true;
  desktops.hyprland.enable = true;
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

  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  # Necessarry programs
  programs = {
    obs-studio.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
