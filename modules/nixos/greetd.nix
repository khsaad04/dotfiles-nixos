{ pkgs
, config
, ...
}:
{
  services.greetd = {
    settings =
      let
        session = {
          user = "khsaad";
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
              --time \
              --asterisks \
              --user-menu \
              --remember \
              --remember-session \
              --cmd ${config.local.DE.defaultSession}
          '';
        };
      in
      {
        default_session = session;
        initial_session = session;
      };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';
}
