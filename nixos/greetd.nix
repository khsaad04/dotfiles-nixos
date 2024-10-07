{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings =
      let
        session = {
          user = "greeter";
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --remember \
            --remember-session \
            --cmd sway
          '';
        };
      in
      {
        default_session = session;
      };
  };
}
