{ pkgs
, config
, ...
}:
{
  services.greetd = {
    settings = {
      default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --remember \
          --remember-session \
          --cmd ${config.local.DE.defaultSession}
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
    Hyprland
  '';
}
