{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
    ./desktops
    ./terminals
    ./dunst.nix
    ./firefox.nix
    ./fish.nix
    ./foot.nix
    ./lf.nix
    ./neofetch.nix
    ./nvim
    ./scripts.nix
    ./starship.nix
    ./theme.nix
    ./tmux.nix
    ./waybar.nix
    ./wezterm.nix
    ./wofi.nix
  ];
}
