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

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.sway.enable = true;
  services.network-manager-applet.enable = true;
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
    walker.enable = true;
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
  };

  home.packages = [
    pkgs.wl-clipboard
    pkgs.qbittorrent
    pkgs.pavucontrol
    pkgs.libreoffice
    inputs.self.packages.${pkgs.system}.formatter
    pkgs.cargo
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-openbangla-keyboard ];
  };
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  fonts.fontconfig.enable = true;

  news.display = "silent";
  dconf.enable = true;
}
