{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.local.greetdConfig;
in
{
  options.local.greetdConfig.enable = lib.mkEnableOption "Enable greetd configurations";
  config = lib.mkIf cfg.enable {
    services.greetd = {
      inherit (cfg) enable;
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
              --cmd ${config.local.DE.defaultSession}
            '';
          };
        in
        {
          default_session = session;
        };
    };
  };
}
