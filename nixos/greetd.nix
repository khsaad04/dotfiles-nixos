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
            --cmd Hyprland
          '';
        };
      in
      {
        default_session = session;
      };
  };
}
