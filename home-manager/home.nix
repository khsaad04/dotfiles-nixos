{ config, pkgs, username, ... }:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    ./neovim
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    git
    neofetch
    firefox
    foot
    waybar
    wofi
    swww
    networkmanagerapplet
    dunst
    libnotify
    grim
    slurp
    starship
    wl-clipboard
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
