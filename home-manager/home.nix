{ config, pkgs, ... }:

{
  home.username = "khsaad";
  home.homeDirectory = "/home/khsaad";

  imports = [
    ./neovim
  ];

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
    rustup
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "khsaad04";
    userEmail = "khsaad0404@gmail.com";
  };

  gtk = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      package = pkgs.fira-code-nerdfont;
      size = 11;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
