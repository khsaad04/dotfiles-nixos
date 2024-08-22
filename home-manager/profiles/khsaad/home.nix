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

  programs = {
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

  home.packages = [
    pkgs.nitch
    pkgs.wl-clipboard
    pkgs.hyperfine
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
