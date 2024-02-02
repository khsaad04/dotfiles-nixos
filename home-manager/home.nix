{ pkgs, username, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./dunst.nix
    ./fish.nix
    ./foot.nix
    ./hyprland
    ./neovim
    ./starship.nix
    ./theme.nix
    ./waybar.nix
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    git
    neofetch
    firefox
    wofi
    swww
    networkmanagerapplet
    grim
    slurp
    pamixer
    rustup
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "khsaad04";
    userEmail = "khsaad0404@gmail.com";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
