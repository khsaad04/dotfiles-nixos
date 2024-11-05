{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    sway = {
      enable = true;
      extraPackages = lib.mkForce [ ];
    };
    nix-ld.enable = true;
    git.enable = true;
    nano.enable = false;
    fish.enable = true;
    adb.enable = true;
    command-not-found.enable = false;
    direnv = {
      enable = true;
      silent = true;
    };
    kdeconnect.enable = true;
  };

  services = {
    fstrim.enable = true;
    udisks2.enable = true;
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Dhaka";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [ pkgs.fcitx5-openbangla-keyboard ];
    };
  };

  environment.systemPackages = [
    pkgs.xdg-utils
    pkgs.vim
    pkgs.wget
    pkgs.qemu
    pkgs.file
    pkgs.fd
    pkgs.ripgrep
    pkgs.btop
    (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
      qemu-system-x86_64 \
        -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
        "$@"
    '')
  ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.khsaad = {
      isNormalUser = true;
      initialPassword = "khsaad";
      description = "KH Saad";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
      ];
      packages = [
        pkgs.wl-clipboard
        pkgs.qbittorrent
        pkgs.pavucontrol
        pkgs.cargo
        pkgs.gcc
        pkgs.python3
        inputs.self.packages.${pkgs.system}.formatter
        inputs.self.packages.${pkgs.system}.changevolume
        inputs.self.packages.${pkgs.system}.powermenu

        pkgs.sway
        pkgs.wl-clip-persist
        pkgs.findutils
        pkgs.sway-contrib.grimshot
        pkgs.adw-gtk3
        pkgs.adwaita-icon-theme
        pkgs.xorg.xrdb
        pkgs.qt6Packages.qtstyleplugin-kvantum
        pkgs.qt6Packages.qt6ct
        pkgs.libsForQt5.qtstyleplugin-kvantum
        pkgs.libsForQt5.qt5ct
        pkgs.firefox-bin
        pkgs.fish
        pkgs.foot
        pkgs.neovim
        pkgs.luajitPackages.jsregexp
        pkgs.gcc
        pkgs.gnumake
        pkgs.unzip
        pkgs.tree-sitter
        pkgs.ripgrep
        pkgs.fd
        pkgs.lua-language-server
        pkgs.nil
        pkgs.stylua
        pkgs.prettierd
        pkgs.starship
        pkgs.tmux
        pkgs.tmux-sessionizer
        pkgs.tofi
        pkgs.waybar
        pkgs.playerctl
        pkgs.yazi
        pkgs.zathura
        pkgs.obs-studio
        pkgs.mpv
        pkgs.feh
        pkgs.git
        pkgs.dunst
        pkgs.libnotify
        pkgs.udiskie
        pkgs.networkmanagerapplet
      ];
    };
  };

  documentation = {
    info.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "24.05";
}
