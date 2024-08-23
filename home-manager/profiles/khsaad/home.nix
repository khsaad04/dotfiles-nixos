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
      wallpaper = "${config.local.theming.wallpath}/wp.png";
    };
  };
  wayland.windowManager.hyprland.enable = true;
  gtk.enable = true;
  programs = {
    matugen.enable = true;
    neovim.enable = true;
    foot.enable = true;
    waybar.enable = true;
    eza.enable = true;
    firefox.enable = true;
    fish.enable = true;
    starship.enable = true;
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
  };

  home.packages = [
    pkgs.wl-clipboard
    pkgs.qbittorrent
    pkgs.pavucontrol
    inputs.self.packages.${pkgs.system}.formatter
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

  news.display = "silent";
  dconf.enable = true;
}
