{
  pkgs,
  username,
  inputs,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./dunst.nix
    ./firefox.nix
    ./fish.nix
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

  home.packages = with pkgs; [
    obs-studio
    hyperfine
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  fonts.fontconfig.enable = true;

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
