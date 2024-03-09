{
  pkgs,
  username,
  inputs,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./dunst.nix
    ./firefox.nix
    ./fish.nix
    ./foot.nix
    ./hypr.nix
    ./lf.nix
    ./neofetch.nix
    ./nvim
    ./scripts.nix
    ./starship.nix
    ./sway.nix
    ./theme.nix
    ./tmux.nix
    ./waybar.nix
    ./wezterm.nix
    ./wofi.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # Custom module options go here
  desktops.sway.enable = true;
  # desktops.hyprland.enable = true;

  terminals = {
    defaultTerminal = "wezterm";
    wezterm.enable = true;
    foot.enable = true;
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

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
