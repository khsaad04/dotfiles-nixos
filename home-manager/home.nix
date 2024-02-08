{ pkgs, username, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./dunst.nix
    ./fish.nix
    ./foot.nix
    ./hypr
    # ./sway
    ./neofetch.nix
    ./nvim
    ./scripts.nix
    ./starship.nix
    ./theme.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    firefox
    rustup
    obs-studio
    feh
  ];

  programs.git = {
    enable = true;
    userName = "khsaad04";
    userEmail = "khsaad0404@gmail.com";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
