{ config, pkgs, ... }:

{
  home.username = "khsaad";
  home.homeDirectory = "/home/khsaad";

  imports = [
    ./neovim
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    vim
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
