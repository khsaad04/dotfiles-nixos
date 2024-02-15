{
  pkgs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./dunst.nix
    ./fish.nix
    ./hypr
    # ./sway
    ./lf.nix
    ./neofetch.nix
    ./nvim
    ./scripts.nix
    ./starship.nix
    ./theme.nix
    ./waybar.nix
    ./wezterm.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    firefox
    rustup
    obs-studio
  ];

  programs.git = {
    enable = true;
    userName = "khsaad04";
    userEmail = "khsaad0404@gmail.com";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
