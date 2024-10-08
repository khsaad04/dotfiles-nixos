{
  pkgs,
  inputs,
  config,
  ...
}:
{
  local = {
    theming = {
      enable = true;
      wallpaper = "${config.local.theming.wallpath}/wp.jpg";
    };
  };

  wayland.windowManager.sway.enable = true;
  gtk.enable = true;
  qt.enable = true;
  programs = {
    firefox.enable = true;
    fish.enable = true;
    kitty.enable = true;
    neovim.enable = true;
    matugen.enable = true;
    starship.enable = true;
    tmux'.enable = true;
    tofi.enable = true;
    waybar.enable = true;
    wofi.enable = true;
    yazi.enable = true;

    zathura.enable = true;
    home-manager.enable = true;
    obs-studio.enable = true;
    mpv.enable = true;
    feh.enable = true;
    git = {
      enable = true;
      userName = "khsaad04";
      userEmail = "khsaad0404@gmail.com";
    };
  };

  services = {
    dunst.enable = true;
    udiskie.enable = true;
    network-manager-applet.enable = true;
  };

  home.packages = [
    pkgs.wl-clipboard
    pkgs.qbittorrent
    pkgs.pavucontrol
    inputs.self.packages.${pkgs.system}.formatter
    inputs.self.packages.${pkgs.system}.changevolume
    inputs.self.packages.${pkgs.system}.powermenu
  ];

  fonts.fontconfig.enable = true;

  news.display = "silent";
  dconf.enable = true;
}
